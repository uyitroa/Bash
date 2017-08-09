result=1
for (( i = 1 ; i <= $1 ; i++ ))
do
	result=`expr $result \* $i `
done
echo $result