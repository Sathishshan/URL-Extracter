#!/bin/bash

#argument check

if [ $# -ne 2 ]; then
    echo "USAGE: Need two arguments to run the script. E.g: $0 viewsource-page savefile"
    exit
fi

#working area

no_js=$1
save=$2
grep -Po '(?:(?<=href="\/url\?q\=)https?:\/\/[^;]+)' ${no_js} | sed 's+&amp$++g' >> ${save}
#sed &amp - For query string ignorance
sed -i -r '/^https?:\/\/www\.google\.com/d' ${save}
sed -i -r '/^https?:\/\/accounts\.google\.com/d' ${save}
#sed google.com & account.google.com - Is for incase of google preference urls

echo "log generated!"
