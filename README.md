# atmigtnca.github.io

서종호의 개인 포트폴리오 사이트 소스다. Hugo로 만들고 GitHub Actions가 GitHub Pages에 배포한다.

- 사이트: https://atmigtnca.github.io/
- 대표 활동: [JCloud 2026년 여름 재구축](https://atmigtnca.github.io/projects/jcloud-rebuild/)

## 필요한 도구

| 도구 | 버전 | 용도 |
|---|---|---|
| Hugo extended | 0.167.0 | 사이트 빌드. 워크플로도 같은 버전을 쓴다 |
| Python | 3.12 (3.10 이상이면 된다) | `.github/pages_build.py` 실행 |
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
