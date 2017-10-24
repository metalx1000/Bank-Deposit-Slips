#!/bin/bash

tmpfile="/tmp/suncoast_deposit_2014.html"
rm "/tmp/suncoast_deposit_2014.html"
clear

echo "Downloading template..."
wget "https://raw.githubusercontent.com/metalx1000/Bank-Deposit-Slips/master/suncost_credit_union/suncoast_deposit_2014.html" -O "$tmpfile"

echo -n "Name: "
read nname

echo -n "Member Number: "
read memnum

ddate=`date +%m-%d-%Y`

echo -n "Check Amount: "
read chamt

echo -n "Total Check: "
read checkd

echo -n "Total Cash: "
read cashd

echo -n "Total Deposite: "
read dtotal

echo -n "Cash Back: "
read cashb

sed -i "s/nname/$nname/" $tmpfile
sed -i "s/memnum/$memnum/" $tmpfile
sed -i "s/ddate/$ddate/" $tmpfile
sed -i "s/chamt/$chamt/" $tmpfile
sed -i "s/cashd/$cashd/" $tmpfile
sed -i "s/checkd/$checkd/" $tmpfile
sed -i "s/dtotal/$dtotal/" $tmpfile
sed -i "s/cashb/$cashb/" $tmpfile

xdg-open $tmpfile
