#!/usr/bin/env bash
find "$1" -depth -print0 | while IFS= read -r -d '' file; do
  d="$(dirname "$file")"
  f="$(basename "$file")"
  new="${f//[^a-zA-Z0-9\/\._\-]/}"
  if [ "$f" != "$new" ]; then
    if [ -e "$d/$new" ]; then
      echo "Notice: \"$new\" and \"$f\" both exist in \"$d\":"
      ls -ld "$d/$new" "$d/$f"
    else
      mv "$file" "$d/$new"
    fi
  fi
done
