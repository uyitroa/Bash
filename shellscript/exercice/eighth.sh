enable -n echo

echo "Type the result: \c"; read result

case $result in
	[20-16]) echo "Very good";;
	15 | 14) echo "Good";;
	13 | 12) echo "Not bad";;
	11 | 10) echo "Average";;
	[0-9]) echo "Bad";;
	*) echo "Fuck off";;
esac