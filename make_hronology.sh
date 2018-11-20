#!/bin/bash

for file in `find text -regextype posix-extended -regex '.*\.txt' | sort`; do
echo "add $file"
	cp "$file" pdr.txt
	git add pdr.txt
	git commit -m "$file"
echo "$file done"
done

