# 운영

<div class="lead-sm">지금 Nabi에 무엇이 들어갈지 누가 정하는지, 변경이 어떻게 들어가는지 적었습니다.</div>

## 누가 정하나

Nabi는 [DaminStudio](https://daminstudio.com)가 시작했고 유지합니다. DaminStudio의 메인테이너가 변경을 검토해 병합하고, 릴리스마다 담을 것을 정하고, 릴리스를 냅니다. 재단, 운영 위원회, RFC 절차는 아직 없습니다. 메인테이너가 더 넓어지면 그 사실과 정하는 방법을 이 페이지에 적겠습니다.

## 변경이 들어가는 길

- 버그와 작은 변경: [이슈](https://github.com/nabi-lang/nabi/issues)를 열거나 바로 풀 리퀘스트를 보냅니다.
- 언어나 표준 라이브러리의 변경: 코드보다 설계를 먼저 정하도록 [GitHub Discussions](https://github.com/nabi-lang/nabi/discussions)나 이슈에서 시작합니다. 언어는 [사양](https://github.com/nabi-lang/spec)이 정의하며, 겉으로 드러나는 동작을 바꾸면 영어판과 한국어판을 같은 변경에서 고칩니다.
- 풀 리퀘스트는 모두 저장소의 검사를 통과하고 DCO 서명을 답니다. 자세한 것은 [커뮤니티](community.html#기여하기)에 있습니다.

결정의 이유는 결정을 내린 곳에 적습니다. 이슈, 토론, 풀 리퀘스트입니다.

## 릴리스

1.0 전에는 부 버전이 호환을 깨는 자리입니다. 0.2.0은 0.1용 코드를 깰 수 있고, 0.1.x 릴리스는 기능과 수정을 더할 뿐 코드를 깨지 않습니다. 버전은 할 일이 끝나면 나옵니다. 순서는 [로드맵](roadmap.html)에, 릴리스마다의 노트는 [릴리스](releases/index.html)에 있습니다. 수정은 가장 최근 계열에만 나옵니다.

## 패키지

공식 패키지는 [nabi-lang](https://github.com/nabi-lang) 조직에서 내며, 툴체인처럼 유지합니다. [packages.nabi-lang.org](https://packages.nabi-lang.org)의 다른 패키지는 각 소유자의 것입니다. 레지스트리가 무엇을 받고 패키지를 어떻게 내리는지는 [이용 정책](https://packages.nabi-lang.org/policy)에 있습니다.
