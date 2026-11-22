# Nabi 0.1.3: nabi audit

<!-- date: 2026-11-22 -->

<div class="lead-sm">Nabi 0.1.3 adds <code>nabi audit</code>, which checks the packages your project pins against the security advisories of the package registry. Update with <code>nabi toolchain update</code>, or install again from the <a href="../download.html">download page</a>.</div>

## Checking a project

```sh
nabi audit
```

`nabi audit` reads `nabi.lock` and checks every registry package in it against the advisories published at [packages.nabi-lang.org/advisories](https://packages.nabi-lang.org/advisories). For each one that applies it prints the advisory's id and summary, its severity, and the version to update to, such as `nabi update json`.

It exits with 0 when nothing is affected, 1 when something is, and 2 when it could not check, so a CI job can run it as a gate:

```yaml
- run: nabi audit
```

`--json` prints machine-readable records, `--ignore <id>` skips an advisory you have read and accepted, and `--offline` uses only the cached list. The list is fetched once and kept for an hour. Path and git dependencies are not checked, and the output says which ones it skipped.

## Advisories on the registry

Advisories are in the [OSV](https://ossf.github.io/osv-schema/) format other ecosystems use. Each has a page, the versions it affects carry a banner, and the whole list is an API at `/api/v1/advisories?format=json`. To report a vulnerability in a package, tell its owners first; for the registry or the toolchain, write to [security@nabi-lang.org](mailto:security@nabi-lang.org).

The guide's [Security advisories](docs:learn/packages/04-security-advisories.html) page has the details. The full list of changes is in the [release notes](https://github.com/nabi-lang/nabi/releases/tag/v0.1.3).
