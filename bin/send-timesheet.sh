#!/bin/bash

date=$(date +'%B %d, %Y')
lastmonth=$(date +%Y-%m-15)
month=$(date --date="$lastmonth -1 month" +%m)
monthlong=$(date --date="$lastmonth -1 month" +%B)
year=$(date --date="$lastmonth -1 month" +%Y)
echo $lastmonth $month $monthlong $year
to="$TIMESHEET_CLIENT_EMAIL"
recruiter="$TIMESHEET_CLIENT_CO"
file="$(find $HOME/downloads -name Timesheet* | tail -n 1)"
tmpfile=$(mktemp /tmp/send-timesheetXXXX.txt)
title="Timesheet approval - $monthlong $year"
cat > $tmpfile << EOF
Hi,

$recruiter would like an approval / signature for the following timesheet.

Thanks!

CP
EOF

echo to: $to
echo $title
echo attach: $file
cat $tmpfile

read -p "Are you sure? [y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]];then
  cat $tmpfile | mailx -A gmail -s "$title" -a "$file" $to
fi
