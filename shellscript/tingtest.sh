enable -n echo
write()
{
	echo "Idk what the fuck are you doing";
	return;
}
i=20
while [ $i -ge 0 ]
do
	write
	i=`expr $i - 1`
	if [ $i -eq 1 ] ; then
		echo "Do you want to respam shit? \c" ; read answer
		if [ $answer -eq 1 ] || [ $answer = "y" ] || [ $answer = "yes" ] 
		then
			i=20
		fi
	fi
done