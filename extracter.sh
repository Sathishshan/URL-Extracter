#!/bin/bash

#argument check

if [ $# -ne 2 ]; then
    echo "USAGE: Need two arguments to run the script. E.g: $0 viewsource-page savefile"
    exit
fi

#working area

no_js=$1
save=$2
grep -Po '(?:(?<=href="\/url\?q\=)https?:\/\/[\w.-\/%?&:@=\\+#]+)' ${no_js} | sed 's+&amp++g' >> ${save}
#sed &amp for query string ignorance
sed -i -r '/^https?:\/\/www\.google\.com/d' ${save}
#sed google.com is for incase of google preference url

echo "log generated!"
