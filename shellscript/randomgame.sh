enable -n echo #Enable shit to able to 
numbers=( 1 2 3 4 5 6 7 8 9 ) # Set list to guess
echo "Think a number from 1 to 9 (return return to continue) "; read key
win=0 # Set variable to start/stop while loop
declare -a already # Set a blank list that compare if a number has been guessed or not
while [ $win -eq 0 ] #Loop until computer guess the number
do
	item=${numbers[$RANDOM % ${#numbers[@]}]} # Select a random number
	while [[ ${already[*]} == *$item* ]] #Loop if the number was asked already and guess anther number
	do
		item=${numbers[$RANDOM % ${#numbers[@]}]}
	done
	echo "Is your number $item (y or n) ? \c"; read answer # Ask player
	if [ $answer = 'y' ] ; then #If it is, exit
		echo "Yeah i guessed it!"
		win=1 #Stop the loop
	else
		already+=( $item ) #If not, add the number 
	fi
done
# That's it, thanks for reading this shit.