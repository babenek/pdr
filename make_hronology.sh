#!/bin/bash

for file in `find html -regextype posix-extended -regex '.*\.html'`; do
echo "add $file"
	cp "$file" pdr.html
	git add pdr.html
	git commit -m "$file"
echo "$file done"
done

