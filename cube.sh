#!/bin/sh

onum=1920
cnum=16
fchfile=Test.FChk
outfile=gaas_

mkcube ()
{
    local fchfile=$1
    local outfile=$2
    local start=$3
    local end=$4
    for num in `seq $start $end`
    do
        fnum=`printf "%05d" $num`
        echo  "start $num"
        cubegen 0 mo=$num $fchfile  ${outfile}${fnum}.cube 0 h
    done
}

#  (insert (format "\n%s" (shell-command-to-string "pwd")))

pnum=$((($onum / $cnum) + 1))
pre_num=1
next_num=$(($pre_num + $pnum))

while [ $next_num -lt $onum ]
do
    mkcube $fchfile $outfile $pre_num $next_num &
    pre_num=$(($next_num + 1))
    next_num=$(($next_num + $pnum))
done
mkcube $fchfile $outfile $pre_num $onum &


wait
