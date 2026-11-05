#!/usr/bin/env bash
# 빌드 결과(public/)에 남으면 안 되는 것을 찾는다.
# 사용: python3 .github/pages_build.py --build && bash tools/check-public.sh
set -u
dir="${1:-public}"
if [ ! -f "$dir/index.html" ]; then
  echo "빌드 결과가 없다: $dir/index.html" >&2
  exit 2
fi

fail=0
check() {
  local name="$1" pattern="$2"
  local hits
  hits=$(grep -rnoE --include='*.html' "$pattern" "$dir" | head -5)
  if [ -n "$hits" ]; then
    echo "실패: $name"
    echo "$hits" | sed 's/^/  /'
    fail=1
  else
    echo "통과: $name"
  fi
}

check "개인 PC 주소(localhost, 127.0.0.1, file://)" 'localhost|127\.0\.0\.1|file://'
check "HTTP 자산(혼합 콘텐츠)" '(src|href)="?http://'
check "내부 IP" '172\.22\.[0-9]+\.[0-9]+|\b10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\b'
check "빈 링크(href=\"\", href=\"#\")" 'href=(""|"#"|#)?( |>)'

missing=$(grep -rL --include='*.html' '<html lang=ko' "$dir")
if [ -n "$missing" ]; then
  echo "실패: lang=ko 없는 페이지"
  echo "$missing" | sed 's/^/  /'
  fail=1
else
  echo "통과: 모든 페이지 lang=ko"
fi

exit "$fail"
