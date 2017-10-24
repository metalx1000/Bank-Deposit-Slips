#!/bin/bash

tmpfile="/tmp/suncoast_deposit_2014.html"
tmpfile2="/tmp/suncoast_deposit_2014_back.html"
rm "$tmpfile"
rm "$tmpfile2"

clear

echo "Downloading template..."
wget "https://raw.githubusercontent.com/metalx1000/Bank-Deposit-Slips/master/suncost_credit_union/suncoast_deposit_2014.html" -O "$tmpfile"
wget "https://raw.githubusercontent.com/metalx1000/Bank-Deposit-Slips/master/suncost_credit_union/suncoast_deposit_2014_back.html" -O "$tmpfile2"

echo -n "Name: "
read nname

echo -n "Member Number: "
read memnum

ddate=`date +%m-%d-%Y`

echo -n "Check#1: $"
read check1
if [ "$check1" = "" ]
then
  check1=0.00
fi

echo -n "Check#2: $"
read check2
if [ "$check2" = "" ]
then
  check2=0.00
fi

echo -n "Check#3: $"
read check3
if [ "$check3" = "" ]
then
  check3=0.00
fi

echo -n "Check#4: $"
read check4
if [ "$check4" = "" ]
then
  check4=0.00
fi

echo -n "Check#5: $"
read check5
if [ "$check5" = "" ]
then
  check5=0.00
fi

echo -n "Check#6: $"
read check6
if [ "$check6" = "" ]
then
  check6=0.00
fi

echo -n "Check#7: $"
read check7
if [ "$check7" = "" ]
then
  check7=0.00
fi

checkd="$(echo "$check1 + $check2 + $check3 + $check4 + $check5 + $check6 + $check7"|bc)"

echo -n "Total Cash: $"
read cashd
if [ "$cashd" = "" ]
then
  cashd=0.00
fi

#echo -n "Total Deposite: $"
#read dtotal
dtotal="$(echo "$checkd + $cashd"|bc)"

echo -n "Cash Back: $"
read cashb

#edit front
sed -i "s/nname/$nname/" $tmpfile
sed -i "s/memnum/$memnum/" $tmpfile
sed -i "s/ddate/$ddate/" $tmpfile
#sed -i "s/chamt/$chamt/" $tmpfile
sed -i "s/chamt/$dtotal/" $tmpfile
sed -i "s/cashd/$cashd/" $tmpfile
sed -i "s/checkd/$checkd/" $tmpfile
sed -i "s/dtotal/$dtotal/" $tmpfile
sed -i "s/cashb/$cashb/" $tmpfile

#edit back
sed -i "s/check#1/$check1/" $tmpfile2
sed -i "s/check#2/$check2/" $tmpfile2
sed -i "s/check#3/$check3/" $tmpfile2
sed -i "s/check#4/$check4/" $tmpfile2
sed -i "s/check#5/$check5/" $tmpfile2
sed -i "s/check#6/$check6/" $tmpfile2
sed -i "s/check#7/$check7/" $tmpfile2
sed -i "s/checkamt/$checkd/" $tmpfile2

xdg-open $tmpfile2
xdg-open $tmpfile
