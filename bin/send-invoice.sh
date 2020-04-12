#!/bin/bash

date=$(date +'%B %d, %Y')
lastmonth=$(date +%Y-%m-15)
month=$(LC_ALL=fr_CA.utf8 date --date="$lastmonth -1 month" +%m)
monthlong=$(LC_ALL=fr_CA.utf8 date --date="$lastmonth -1 month" +%B)
year=$(LC_ALL=fr_CA.utf8 date --date="$lastmonth -1 month" +%Y)
name="$INVOICE_CLIENT_FIRST_NAME"
to="$INVOICE_CLIENT_EMAIL"
to2="$INVOICE_CLIENT_EMAIL_2"
title="Facture - $monthlong $year"
client="$INVOICE_CLIENT"
file="$(find $HOME/downloads -name Invoice* | tail -n 1)"
tmpfile=$(mktemp /tmp/send-invoiceXXXX.txt)
css="$HOME/.config/email.css"
(cat << EOF
Bonjour $name,

Voici ma facture du mois dernier ($monthlong $year).

Ma feuille de temps est à jour dans [tempo][tempo].

[tempo]: https://aldogroup.atlassian.net/plugins/servlet/ac/io.tempo.jira/tempo-app#!/reports/logged-time/ac5c2fe7-4f60-4163-9730-deef1fff1d6b?columns=WORKED_COLUMN&dateDisplayType=days&from=2020-03-01&groupBy=worker&groupBy=project&periodKey&periodType=LAST_PERIOD&projectKey=EE20&subPeriodType=MONTH&to=2020-03-31&viewType=TIMESHEET&workerId=5a54c8cc7b2b0122a8cd9477

Merci,

CP
EOF
) | pandoc -f markdown -t html -H $css > $tmpfile

echo $title
echo to: $to
echo attach: $file
cat $tmpfile

read -p "Are you sure? [y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]];then
  cat $tmpfile | mailx -M text/html -A gmail -s "$title" -a "$file" $to $to2
fi
