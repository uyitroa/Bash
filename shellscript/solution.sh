howmuch=11
error=0
read howmuch
if test $howmuch -gt 10 -o $howmuch -lt 0
then
error=1
fi
declare -a list
list=(0 0 0 0 0 0)
read -a list
if test ${#list[@]} != 5
then
error=1
fi
sum=0
for ((i=0 ; i<5 ; i++))
do
sum=`expr $sum + ${list[$i]}`
done
echo $sum


