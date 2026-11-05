# atmigtnca.github.io

서종호의 개인 포트폴리오 사이트 소스다. Hugo로 만들고 GitHub Actions가 GitHub Pages에 배포한다.

- 사이트: https://atmigtnca.github.io/
- 대표 활동: [JCloud 2026년 여름 재구축](https://atmigtnca.github.io/projects/jcloud-rebuild/)

## 필요한 도구

| 도구 | 버전 | 용도 |
|---|---|---|
| Hugo extended | 0.167.0 | 사이트 빌드. 워크플로도 같은 버전을 쓴다 |
| Python | 3.9 이상 (워크플로는 3.12) | `.github/pages_build.py` 실행 |
| Git | 2.4x | 소스 관리 |

Node, Go, Dart Sass는 이 테마에서 쓰지 않는다. 워크플로가 설치는 하지만 빌드에 쓰이지 않는다.

### Hugo 설치 (Linux, 관리자 권한 없이)

```bash
mkdir -p ~/.local/opt/hugo-0.167.0 ~/.local/bin
curl -fL https://github.com/gohugoio/hugo/releases/download/v0.167.0/hugo_extended_0.167.0_linux-amd64.tar.gz \
  | tar -xz -C ~/.local/opt/hugo-0.167.0
ln -sf ~/.local/opt/hugo-0.167.0/hugo ~/.local/bin/hugo
hugo version   # hugo v0.167.0-...+extended
```

Windows와 macOS는 [Hugo 설치 안내](https://gohugo.io/installation/)에서 extended 0.167.0을 받는다.

## 빌드와 확인

저장소 루트에서 실행한다.

```bash
# 1. 글을 고치면서 보기: 저장할 때마다 다시 그려진다
cd site
hugo server --config hugo.toml,pages.json --theme template --themesDir themes
# 브라우저로 http://localhost:1313/ 을 연다. 끝낼 때는 Ctrl+C

# 2. 배포와 같은 방식으로 빌드: 결과가 public/ 에 생긴다
cd ..
python3 .github/pages_build.py --build
ls public/index.html
```

2번은 GitHub Actions가 실행하는 명령과 같다. 빌드 중 오류가 나면 `준비/빌드 중단:` 뒤에 원인이 나온다. 글 안의 링크는 `relref`로 걸어 두었기 때문에, 없는 페이지를 가리키면 빌드가 `REF_NOT_FOUND`로 멈춘다.

## 어디를 고치나

| 바꾸고 싶은 것 | 파일 |
|---|---|
| 홈 소개 글 | `site/content/_index.md` |
| 소개 페이지 | `site/content/about.md` |
| 활동 글 | `site/content/projects/*.md` (기간, 상태, 도구는 머리말 `[params]`) |
| 사이트 제목, 메뉴, 설명 | `site/hugo.toml` |
| 화면 구조 | `site/layouts/` (테마 파일을 같은 경로로 덮어쓴다) |
| 색, 글꼴, 간격 | `site/assets/css/site.css` 맨 위 `:root` 변수 |
| 배포 주소 | `site/pages.json`의 `baseURL` |

`site/themes/template/`은 테마 원본이라 고치지 않는다. 바꿀 파일이 있으면 같은 경로로 `site/layouts/`에 복사해서 고친다.

## 배포하고 확인하기

1. 고친 뒤 위의 2번 빌드가 성공하는지 본다.
2. `git add <파일>`, `git commit`, `git push origin main`
3. 저장소의 [Actions 탭](https://github.com/atmigtnca/atmigtnca.github.io/actions)에서 방금 커밋으로 시작된 `Deploy Hugo to GitHub Pages` 실행을 연다. `build`와 `deploy` 두 작업이 모두 초록색 체크면 성공이다.
4. https://atmigtnca.github.io/ 를 새로고침해 바뀐 내용을 확인한다. 브라우저 캐시 때문에 안 바뀌어 보이면 강력 새로고침(Ctrl+Shift+R)을 한다.

명령줄에서는 공개 API로 최근 실행 결과를 볼 수 있다.

```bash
curl -s "https://api.github.com/repos/atmigtnca/atmigtnca.github.io/actions/runs?branch=main&per_page=1" \
  | grep -m2 -E '"(status|conclusion)"'
```
