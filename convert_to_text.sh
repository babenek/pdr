#!/bin/bash

for file in $(find html -regextype posix-extended -regex '.*\.html' | sort -r); do
echo "converting $file"

# convert to text
#	html2text -utf8 -style pretty -o "${file%.html}.txt" -width 65536 "$file"
	w3m -I UTF-8 -O UTF-8 -cols 65536 "$file" > "${file%.html}.txt"

    sed -i 's/&mdash;/-/g' "${file%.html}.txt"

	sed -i "s/'/’/g" "${file%.html}.txt"

	sed -i 's/━/-/g' "${file%.html}.txt"

    sed -i 's/---*/--------------------------------------------------------------------------------/g' "${file%.html}.txt"

#	sed -i 's/{.*}//g' "${file%.html}.txt"

	gawk -i inplace -v RS="" '{sub(/\{.*\}/,"")}1' "${file%.html}.txt"

# replace nonbreaking space for UTF
    sed -i 's/\xC2\xA0/ /g' "${file%.html}.txt"

# remove leading and ending whitespace
    sed -i 's/^ *//g' "${file%.html}.txt"
    sed -i 's/ *$//g' "${file%.html}.txt"

# remove double spaces
    sed -i 's/  */ /g' "${file%.html}.txt"

# extra line end conversion
    cat "${file%.html}.txt" | tr '\n' '#' > "$file.utf-8"

    mv "$file.utf-8" "${file%.html}.txt"

    sed -i 's/##*/#/g' "${file%.html}.txt"
    sed -i 's/#/\n\n/g' "${file%.html}.txt"

echo "$file done"
done

mv ./html/*.txt ./text
