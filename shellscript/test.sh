enable -n echo
shit()
{
	echo "completed"
	return
}
for (( i = 1; i <= 9; i++ )) ### Outer for loop ###
do
	for (( j = 1 ; j <= 9; j++ )) ### Inner for loop ##
	do
		shit()
	done
	echo -e -n "\033[40m" #### set back background colour to black
done