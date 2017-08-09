enable -n echo
echo "First number: \c"; read premier
echo "Second number: \c"; read deux

echo "Operation: 1: + , 2: -, 3: x, 4: /"
read choice

if test $choice -eq 1
then
echo "Result of $premier + $deux = `expr $premier + $deux`"
fi

if test $choice -eq 2
then
echo "Result of $premier - $deux = `expr $premier - $deux`"
fi

if test $choice -eq 3
then
echo "Result of $premier * $deux = `expr $premier \* $deux`"
fi

if test $choice == $deux
then
echo "Result of $premier / $deux = `expr $premier / $deux`"
fi