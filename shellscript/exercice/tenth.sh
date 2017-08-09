enable -n echo
input()
{
	echo "Input shit: \c"; read nb1
	echo "Input second shit: \c"; read nb2
	echo "1. +   2. -   3. *   4. /"
	read choice
	case $choice in
		1) echo "Result: `expr $nb1 + $nb2`";;
		2) echo "Result: `expr $nb1 - $nb2`";;
		3) echo "Result: `expr $nb1 \* $nb2`";;
		4) echo "Result: `expr $nb1 / $nb2`"
	esac
}

if [ $# -eq 3 ] ; then
	case $2 in
		"+") echo "Result: `expr $1 + $3`";;
		"-") echo "Result: `expr $1 - $3`";;
		"*") echo "Result: `expr $1 \* $3`";;
		"/") echo "Result: `expr $1 / $3`"
	esac
else
	input
fi
