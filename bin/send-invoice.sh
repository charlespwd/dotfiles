#!/bin/bash

date=$(date +'%B %d, %Y')
lastmonth=$(date +%Y-%m-15)
month=$(LC_ALL=fr_CA.utf8 date --date="$lastmonth -1 month" +%m)
monthlong=$(LC_ALL=fr_CA.utf8 date --date="$lastmonth -1 month" +%B)
year=$(LC_ALL=fr_CA.utf8 date --date="$lastmonth -1 month" +%Y)
name="$INVOICE_CLIENT_FIRST_NAME"
to="$INVOICE_CLIENT_EMAIL"
title="Facture - $monthlong $year"
client="$INVOICE_CLIENT"
file="$(find $HOME/downloads -name Invoice* | tail -n 1)"
tmpfile=$(mktemp /tmp/send-invoiceXXXX.txt)
cat > $tmpfile << EOF
Bonjour $name,

Voici ma facture du mois dernier ($monthlong $year) chez $client.

Merci,

CP
EOF


echo $title
echo to: $to
echo attach: $file
cat $tmpfile

read -p "Are you sure? [y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]];then
  cat $tmpfile | mailx -A gmail -s "$title" -a "$file" $to
fi
