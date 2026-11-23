# Nabi 0.1.3: nabi audit

<!-- date: 2026-11-22 -->

<div class="lead-sm">Nabi 0.1.3은 <code>nabi audit</code>을 더합니다. 프로젝트가 고정한 패키지를 패키지 레지스트리의 보안 권고와 대조합니다. <code>nabi toolchain update</code>로 올리거나 <a href="../download.html">내려받기 페이지</a>에서 다시 설치하세요.</div>

## 프로젝트 검사

```sh
nabi audit
```

`nabi audit`은 `nabi.lock`을 읽고, 그 안의 레지스트리 패키지를 [packages.nabi-lang.org/advisories](https://packages.nabi-lang.org/ko/advisories)에 공개된 보안 권고와 대조합니다. 해당하는 권고마다 ID와 요약, 심각도, 그리고 올려야 할 버전(예: `nabi update json`)을 알려 줍니다.

영향받는 것이 없으면 0, 있으면 1, 확인하지 못했으면 2로 끝나므로 CI 작업에서 관문으로 쓸 수 있습니다.

```yaml
- run: nabi audit
```

`--json`은 기계가 읽을 수 있는 레코드를 출력하고, `--ignore <id>`는 읽고 받아들이기로 한 권고를 건너뛰며, `--offline`은 캐시된 목록만 씁니다. 목록은 한 번 받아 한 시간 동안 둡니다. 경로·git 의존성은 확인하지 않으며, 건너뛴 것을 출력에 밝힙니다.

## 레지스트리의 보안 권고

보안 권고는 다른 생태계도 쓰는 [OSV](https://ossf.github.io/osv-schema/) 형식입니다. 권고마다 페이지가 있고, 해당 버전에는 배너가 붙으며, 전체 목록은 `/api/v1/advisories?format=json` API로 받을 수 있습니다. 패키지의 취약점은 먼저 그 소유자에게, 레지스트리나 toolchain의 취약점은 [security@nabi-lang.org](mailto:security@nabi-lang.org)로 알려 주세요.

자세한 내용은 가이드의 [보안 권고](docs:learn/packages/04-security-advisories.html) 페이지에, 전체 변경 목록은 [릴리스 노트](https://github.com/nabi-lang/nabi/releases/tag/v0.1.3)에 있습니다.
