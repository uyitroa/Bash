enable -n echo
check()
{
	echo "Just type string or integer idk: \c"; read choice
	expr $choice + 1
	if [ $? -eq 0 ]; then
		value=0
	else
		value=1
	fi
	return $value
}
check
value=$?
echo "Value: $value"