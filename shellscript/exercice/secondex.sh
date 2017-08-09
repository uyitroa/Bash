enable -n echo
declare -a planet
planet=( Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto )
i=0
while [ $i -le `expr ${#planet[@]} - 1` ]
do
	echo "${planet[$i]}"
	i=`expr $i + 1`
done

echo; echo

i=0

while [ $i -le `expr ${#planet[@]} - 1` ]
do
	echo "${planet[$i]} \c"
	i=`expr $i + 1`
done

echo; echo "Whoops! Pluto is no longer a planet"

exit 0