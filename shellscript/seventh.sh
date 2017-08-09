enable -n echo
choose()
{
	echo "First number: \c"; read premier
	echo "Second number: \c"; read deux

	echo "Operation: 1: + , 2: -, 3: x, 4: /"
	read choice
}
repeat="yes"
while [ $repeat = "yes" -o $repeat = "y" ]
do
	choose
	case $choice in
		1) echo "Result of $premier + $deux = `expr $premier + $deux`";;
		2) echo "Result of  $premier - $deux = `expr $premier - $deux`";;
		3) echo "Result of $premier * $deux = `expr $premier \* $deux`";;
		4) echo "Result of $premier / $deux = `expr $premier / $deux`";;
	esac
	echo "Redo it? \c" ; read repeat
done