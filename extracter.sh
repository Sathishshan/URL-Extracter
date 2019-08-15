#!/bin/bash

#argument check

if [ $# -ne 2 ]; then
    echo "USAGE: Need two arguments to run the script. E.g: $0 viewsource-page savefile"
    exit
fi

#working area

no_js=$1
save=$2
grep -Po '((?:(?<=href="\/url\?q\=)https?:\/\/[\w.-\/%?&:@=\\+#]+))' $1 | sed 's+&amp++g' >> $2
#sed &amp for query string ignorance
sed -i -r '/^https?:\/\/www\.google\.com/d' $2
#sed google.com is for incase of google preference url

echo "log generated!"
