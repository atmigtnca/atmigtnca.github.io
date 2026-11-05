+++
title = "이 사이트에 대해"
description = "이 사이트를 만든 도구, 테마 출처와 라이선스, 직접 만든 부분과 AI가 만든 부분"
+++

## 만든 방법

[Hugo](https://gohugo.io/) 0.167.0으로 만든 정적 사이트다. 소스는 [GitHub 저장소](https://github.com/atmigtnca/atmigtnca.github.io)에 있고, main에 push하면 GitHub Actions가 빌드해 GitHub Pages로 배포한다. 배포 준비는 수업에서 받은 `prepare_github_pages.py` 3.1로 했다.

## 테마 출처

[Hugo ʕ•ᴥ•ʔ Bear Blog](https://github.com/janraasch/hugo-bearblog) (Jan Raasch, MIT License)를 바탕으로 했다. 테마 원본은 저장소의 `site/themes/template/`에 라이선스 파일과 함께 그대로 두고, 바꾼 부분은 `site/layouts/`에 따로 덮어썼다.

## 직접 만든 부분과 AI가 만든 부분

| 구분 | 내용 | 위치 |
|---|---|---|
| 테마 원본 | Bear Blog 레이아웃과 기본 스타일 | `site/themes/template/` |
| 수업 스크립트 생성 | 배포 워크플로, 빌드 보조 스크립트, 배포 설정 | `.github/`, `site/pages.json`, `.github-pages.json` |
| 직접 작성 | 소개와 활동 글의 사실관계, 메뉴 구성, 공개할 정보와 뺄 정보의 판단 | `site/content/`, `site/hugo.toml` |
| AI와 함께 작성 | 레이아웃 덮어쓰기, 스타일, 재구축 전후 그림(SVG), 문장 다듬기. 코딩 에이전트 OMO(Claude Opus 5.5)가 초안을 쓰고, 사실관계와 공개 범위는 내가 확인해 고쳤다. | `site/layouts/`, `site/assets/css/site.css`, `site/static/images/` |

글에 적은 경력과 날짜, 수치는 모두 내가 남긴 JCloud 운영 기록에서 가져왔다. 기록에 없는 내용은 쓰지 않았다.

