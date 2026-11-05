+++
title = "이 사이트에 대해"
description = "이 사이트를 만든 도구, 테마 출처와 라이선스, 직접 만든 부분과 AI가 만든 부분"
+++

## 만든 방법

[Hugo](https://gohugo.io/) 0.167.0으로 만든 정적 사이트다. 소스는 [GitHub 저장소](https://github.com/atmigtnca/atmigtnca.github.io)에 있고, main에 push하면 GitHub Actions가 빌드해 GitHub Pages로 배포한다. 배포 준비는 수업에서 받은 `prepare_github_pages.py` 3.1로 했다.

## 테마 출처

[Hugo Bear Blog](https://github.com/janraasch/hugo-bearblog) (Jan Raasch, MIT License)를 바탕으로 했다. 테마 원본은 저장소의 `site/themes/template/`에 라이선스 파일과 함께 그대로 두고, 바꾼 부분은 `site/layouts/`에 따로 덮어썼다.

## 직접 만든 부분과 AI가 만든 부분

| 구분 | 내용 | 위치 |
|---|---|---|
| 테마 원본 | Bear Blog 레이아웃과 기본 스타일 | `site/themes/template/` |
| 수업 스크립트 생성 | 배포 워크플로, 빌드 보조 스크립트, 배포 설정 | `.github/`, `site/pages.json`, `.github-pages.json` |
| 직접 작성 | 소개와 활동 글의 사실관계, 메뉴 구성, 공개할 정보와 뺄 정보의 판단 | `site/content/`, `site/hugo.toml` |
| AI와 함께 작성 | 레이아웃 덮어쓰기, 스타일, 재구축 전후 그림(SVG), 문장 다듬기. 코딩 에이전트 OMO(Claude Opus 5.5)가 초안을 쓰고, 사실관계와 공개 범위는 내가 확인해 고쳤다. | `site/layouts/`, `site/assets/css/site.css`, `site/static/images/` |

글에 적은 경력과 날짜, 수치는 모두 내가 남긴 JCloud 운영 기록에서 가져왔다. 기록에 없는 내용은 쓰지 않았다.

## 화면을 어떻게 점검했나

디자인은 [impeccable](https://github.com/pbakaus/impeccable)과 Anthropic의 frontend-design 스킬로 점검했다. 고치기 전 화면을 두 번 따로 평가받아(디자인 리뷰와 자동 검사기) 나온 문제를 하나씩 고치거나, 고치지 않은 이유를 남겼다. 고친 뒤에는 헤드리스 Chrome으로 1440px, 768px, 390px 화면과 200% 확대, 키보드 이동을 다시 확인했다.

고친 화면을 한 번 더 평가받아 남은 문제도 정리했다. 좁은 화면에서 표의 열 이름이 사라지던 것, 어두운 모드에서 그림만 하얗게 남던 것, 긴 기록의 목차가 본문을 밀어내던 것, 기록에 갱신 날짜가 없던 것이다. 빌드 결과에 개인 PC 주소나 내부 주소, 빈 링크가 남지 않았는지는 저장소의 `tools/check-public.sh`로 확인한다.
