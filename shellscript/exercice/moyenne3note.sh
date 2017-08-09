enable -n echo
tex=`cat fichierdemerde.sh`
text=($tex)
counter=0
average=0
declare -a averages
declare -a points
declare -a name
lenList=${#text[@]}
echo "$lenList"
for (( i = 0; i < $lenList + 1 ; i++ ))
do
	if [ $counter -eq 3 ];then
		counter=0
		#echo ${points[*]}

		#echo `expr ( ${points[0]} + ${points[1]} + ${points[2]} ) / 3 `
		point1=${points[0]}
		point2=${points[1]}
		point3=${points[2]}
		#echo $point3
		ave=$((point1+point2))
		aves=$((ave+point3))
		average=$((aves/3))
		points=()
		averages+=($average)
	fi

	expr ${text[$i]} + 1
	if [ $? -eq 0 ];then
		points+=(${text[$i]})
		(( counter++ ))
	else
		name+=(${text[$i]})
	fi
	clear
done

len=${#name[@]}
for (( x = 0; x < $len ; x++ ))
do
	echo "${name[$x]} \c"
	echo "${averages[$x]}"
done