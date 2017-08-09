enable -n echo
inputarray()
{
declare -a ar
echo "Array: \c"; read -a ar
echo ${ar[*]}
eval $1="(${ar[@]})"
}
i='y'
x=0
declare -a arr
inputarray arr
echo ${arr[*]}
arr+=('addedsomeshit')
#declare -a arr
#echo "Array: \c"; read -a arr
while [ $i = "y" ]
do
	echo "${arr[$x]}"
	x=`expr $x + 1`
	if [ $x -eq ${#arr[@]} ] ; then
		echo "Redo? (y or n) \c" ; read i
		if [ $i = 'y' ] ; then
			inputarray arr
			#declare -a arr
			#cho "Array: \c";read -a arr
			x=0
		fi
	fi
done