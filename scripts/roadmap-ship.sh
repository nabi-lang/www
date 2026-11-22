#!/bin/sh
# Mark a toolchain release shipped on the roadmap, in roadmap.md,
# ko/roadmap.md, zh-hans/roadmap.md and zh-hant/roadmap.md:
#
#   scripts/roadmap-ship.sh [-n] [--date YYYY-MM-DD] [--changelog <file>]
#                           [--summary-ko <text>] [--summary-zh-hans <text>]
#                           [--summary-zh-hant <text>] <version>
#
# The card whose rm-ver is <version> leaves its section (a section left
# with no card goes too), and an entry with the date, the Summary line of
# the version's CHANGELOG.md section and a link to the release notes goes
# on top of Shipped (made after Later when missing). Run again, it changes
# nothing.
#
# --changelog defaults to ../nabi/CHANGELOG.md, else the file at the
# v<version> tag on GitHub. The date defaults to the one in the section's
# heading (`## 0.1.0 (2026-12-01)`). The Korean entry takes --summary-ko,
# the Chinese ones --summary-zh-hans and --summary-zh-hant, each else the
# English summary; a language without its roadmap.md is left out. -n
# (--dry-run) prints the diff and writes nothing.
set -eu
# Bytes, not collation: BSD awk compares strings with strcoll, under which
# some Hangul headings are equal.
LC_ALL=C
export LC_ALL

usage() {
	echo "usage: scripts/roadmap-ship.sh [-n] [--date YYYY-MM-DD] [--changelog <file>] [--summary-ko <text>] [--summary-zh-hans <text>] [--summary-zh-hant <text>] <version>" >&2
	exit 2
}

dry=0 date='' changelog='' summary_ko='' summary_hans='' summary_hant='' version=''
while [ $# -gt 0 ]; do
	case $1 in
	-n | --dry-run) dry=1 ;;
	--date)
		[ $# -ge 2 ] || usage
		date=$2
		shift
		;;
	--changelog)
		[ $# -ge 2 ] || usage
		changelog=$2
		shift
		;;
	--summary-ko)
		[ $# -ge 2 ] || usage
		summary_ko=$2
		shift
		;;
	--summary-zh-hans)
		[ $# -ge 2 ] || usage
		summary_hans=$2
		shift
		;;
	--summary-zh-hant)
		[ $# -ge 2 ] || usage
		summary_hant=$2
		shift
		;;
	-*) usage ;;
	*)
		[ -z "$version" ] || usage
		version=$1
		;;
	esac
	shift
done
[ -n "$version" ] || usage

case $version in
v*)
	echo "error: write the version without the v: scripts/roadmap-ship.sh ${version#v}" >&2
	exit 2
	;;
esac
if ! printf '%s\n' "$version" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z.]+)?$'; then
	echo "error: $version is not a release version; write major.minor.patch, e.g. 0.1.0" >&2
	exit 2
fi
if [ -n "$date" ] && ! printf '%s\n' "$date" | grep -Eq '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'; then
	echo "error: --date $date: write the date as YYYY-MM-DD" >&2
	exit 2
fi

root=$(cd "$(dirname "$0")/.." && pwd)
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

if [ -z "$changelog" ]; then
	if [ -f "$root/../nabi/CHANGELOG.md" ]; then
		changelog=$root/../nabi/CHANGELOG.md
	else
		changelog=$tmp/CHANGELOG.md
		url=https://raw.githubusercontent.com/nabi-lang/nabi/v$version/CHANGELOG.md
		curl -fsSL --retry 3 -o "$changelog" "$url" || {
			echo "error: cannot fetch $url; pass --changelog <file>" >&2
			exit 1
		}
	fi
fi
[ -f "$changelog" ] || {
	echo "error: no $changelog; pass --changelog <file>" >&2
	exit 1
}

# The heading's date and the Summary line of the version's section.
# Section: from `## <version> ` to the next `## `.
awk -v v="$version" '
	/^## / {
		if (in_s) exit
		if (index($0, "## " v " ") == 1 || $0 == "## " v) {
			in_s = 1
			d = $0
			sub(/^## [^ ]+ */, "", d)
			gsub(/[()]/, "", d)
			print "date\t" d
		}
		next
	}
	in_s && /^Summary:/ {
		s = $0
		sub(/^Summary:[ \t]*/, "", s)
		print "summary\t" s
	}
' "$changelog" > "$tmp/section"
grep -q '^date' "$tmp/section" || {
	echo "error: $changelog has no \`## $version\` section; write the release's CHANGELOG first" >&2
	exit 1
}
head_date=$(sed -n 's/^date	//p' "$tmp/section")
summary=$(sed -n 's/^summary	//p' "$tmp/section" | head -1)
if [ -z "$date" ]; then
	if ! printf '%s\n' "$head_date" | grep -Eq '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'; then
		echo "error: the CHANGELOG section of $version is dated \"$head_date\"; release it first (## $version (YYYY-MM-DD)) or pass --date YYYY-MM-DD" >&2
		exit 1
	fi
	date=$head_date
fi
case $summary in
'' | *TODO*)
	echo "error: the CHANGELOG section of $version has no Summary line; write \"Summary: <one sentence>\" in it" >&2
	exit 1
	;;
esac
[ -n "$summary_ko" ] || {
	echo "note: no --summary-ko; ko/roadmap.md gets the English summary" >&2
	summary_ko=$summary
}
for l in zh-hans zh-hant; do
	[ -f "$root/$l/roadmap.md" ] || continue
	case $l in
	zh-hans) [ -n "$summary_hans" ] || { echo "note: no --summary-zh-hans; zh-hans/roadmap.md gets the English summary" >&2; summary_hans=$summary; } ;;
	zh-hant) [ -n "$summary_hant" ] || { echo "note: no --summary-zh-hant; zh-hant/roadmap.md gets the English summary" >&2; summary_hant=$summary; } ;;
	esac
done

# Markdown inline text to HTML: escape, then `code`.
# shellcheck disable=SC2016 # the backticks are literal
html() {
	printf '%s\n' "$1" | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' \
		-e 's/`\([^`]*\)`/<code>\1<\/code>/g'
}

# ship <file> <shipped heading> <later heading> <libraries heading> <notes label> <summary>
ship() {
	f=$1
	[ -f "$f" ] || {
		echo "error: no $f" >&2
		exit 1
	}
	link="<a href=\"https://github.com/nabi-lang/nabi/releases/tag/v$version\">$5</a>"
	# No space after a full-width stop (Chinese).
	sp=' '
	case $6 in *。) sp='' ;; esac
	ENTRY="<div class=\"rm-entry\"><span class=\"rm-ver\">$version</span><time datetime=\"$date\">$date</time><p>$(html "$6")$sp$link</p></div>" \
	SHIPPED=$2 LATER=$3 LIBS=$4 VER=$version awk '
		{ line[++n] = $0 }
		END {
			ver = "<span class=\"rm-ver\">" ENVIRON["VER"] "</span>"
			# The card: <section class="rm-card ..."> to </section>, its
			# header naming the version.
			for (i = 1; i <= n; i++) {
				if (line[i] ~ /^<section class="rm-card / && index(line[i + 1], ver)) {
					for (j = i; j <= n && line[j] != "</section>"; j++) ;
					for (k = i; k <= j; k++) drop[k] = 1
					# Its section: the heading above, the <div class="rm">
					# below it, up to the closing </div>.
					for (h = i; h > 0 && line[h] !~ /^## /; h--) ;
					for (c = j + 1; c <= n && line[c] != "</div>"; c++) ;
					left = 0
					for (k = h; k < c; k++) if (!drop[k] && line[k] ~ /^<section /) left = 1
					if (!left && h > 0) {
						for (k = h; k <= c; k++) drop[k] = 1
						if (line[c + 1] == "") drop[c + 1] = 1
					}
					i = j
				}
			}
			# Shipped, or where it goes: after Later, else before
			# Libraries, else at the end.
			have = 0; open = 0; later = 0; libs = 0
			for (i = 1; i <= n; i++) {
				if (line[i] == "## " ENVIRON["SHIPPED"]) have = i
				if (have && !open && line[i] == "<div class=\"rm-log\">") open = i
				if (open && index(line[i], "<div class=\"rm-entry\">" ver)) dup = 1
				if (line[i] == "## " ENVIRON["LATER"]) later = i
				if (line[i] == "## " ENVIRON["LIBS"]) libs = i
			}
			at = 0
			if (!have) {
				if (later) {
					for (at = later + 1; at <= n && line[at] !~ /^## /; at++) ;
				} else if (libs) {
					at = libs
				} else {
					at = n + 1
				}
			}
			for (i = 1; i <= n + 1; i++) {
				if (i == at) {
					if (at > n) print ""
					print "## " ENVIRON["SHIPPED"]
					print ""
					print "<div class=\"rm-log\">"
					print ENVIRON["ENTRY"]
					print "</div>"
					if (at <= n) print ""
				}
				if (i > n) break
				if (!drop[i]) print line[i]
				if (i == open && !dup) print ENVIRON["ENTRY"]
			}
		}
	' "$f" > "$tmp/out"
	if cmp -s "$f" "$tmp/out"; then
		echo "${f#"$root"/}: $version already shipped"
		return
	fi
	if [ "$dry" = 1 ]; then
		diff -u "$f" "$tmp/out" | sed "s|$root/||" || :
	else
		cat "$tmp/out" > "$f"
		echo "${f#"$root"/}: $version shipped on $date"
	fi
}

ship "$root/roadmap.md" "Shipped" "Later" "Libraries" "Release notes" "$summary"
ship "$root/ko/roadmap.md" "출시됨" "나중" "라이브러리" "릴리스 노트" "$summary_ko"
[ ! -f "$root/zh-hans/roadmap.md" ] || ship "$root/zh-hans/roadmap.md" "已发布" "以后" "库" "发布说明" "$summary_hans"
[ ! -f "$root/zh-hant/roadmap.md" ] || ship "$root/zh-hant/roadmap.md" "已發布" "之後" "函式庫" "發行說明" "$summary_hant"
