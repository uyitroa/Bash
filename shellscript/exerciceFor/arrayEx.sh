read number
declare -a array
read -a array
sum=0
for (( i=0 ; i<$number ; i++ ))
do
    sum=`expr $sum + ${array[$i]}`
done
echo $sum
