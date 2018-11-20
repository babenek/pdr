#!/bin/bash

for file in `find html -regextype posix-extended -regex '.*\.html'`; do
echo "converting $file"
    iconv --from-code WINDOWS-1251 --to-code utf-8 "$file" -o "$file.utf-8"
    sed -i 's/charset=windows-1251/charset=utf-8/g' "$file.utf-8"
	mv "$file.utf-8" "$file"
echo "$file done"
done

