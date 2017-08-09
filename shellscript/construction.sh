enable -n echo # Enable 
clear

findValidLength() # Function to help find valid words
{
	listLen=${#listWord[@]} # Length of list
	declare -ga validLengthWords # Set a list valid length words
	clear
	for (( i = 0; i < $listLen ; i++ )) # Test every word of the list
	do
		chrlen=${#listWord[$i]} # Variable integer to length of the charater of the list
		if [ $chrlen -eq $1 ]; then # If the word's length is equal to the length the user inputted
			validLengthWords+=("${listWord[$i]}") #Add valid length words to list
		fi
	done
	findListLetter #Use findListLetter
}

findListLetter() # Function to create list letter of the rest of word to ask hint again
{
	lengthList=${#validLengthWords[@]} #Create integer of length list validlengthwords
	declare -ga maybeValidLetters # Create blank list for letter
	clear
	nothing='' # Nothing
	for (( u = 0; u < $lengthList ; u++ )) # Test each word of validLengthWords 
	do
		chrslen=${#validLengthWords[$u]} # Set word's length of validLengthWords
		for (( o = 0 ; o < $chrslen ; o ++)) # Test each letter of the word
		do
			word=${validLengthWords[$u]} # Set the word of the list
			letter=${word:o:1} # Set the letter of the word
			nothing=$?
			if [ ${maybeValidLetters} == *$letter* ] ; then # Check if the letter's already in the list mabeValidLetters
				nothing=$?
			else
				nothing=$?
				maybeValidLetters+=("$letter") # If not, add the letter to the list
			fi
			clear
		done
	done
}

findValidletter()
{
	lenWord=${#validLengthWords[@]} # Length of word's list
	declare -ga validLettersWords # Set a blank list valid letter words
	clear
	validLettersWords=() #Reset to avoid old word appear
	for (( x = 0; x < $lenWord ; x++ )) # Test every word of the list
	do
		worded=${validLengthWords[$x]}
		if [[ $worded == *$1* ]]; then # If the word contains the letter
			validLettersWords+=("${validLengthWords[$x]}") #Add valid words to list
		fi
		if [[ $worded != *$1* ]]; then	# Remove the word from list length to avoid two same word in validLetterWords
			validLengthWords[$x]=''
		fi
	done
}

randomLetter() # Ask a random letter in a word
{
	win=0 # When to stop/ start loop
	declare -a already
	while [ $win -eq 0 ] #Loop until win is not equal to 0
	do
		if [ ${#validLettersWords[@]} -le 3 ] && [ ${#validLettersWords[@]} -gt 0 ]; then # If it rest only three choice to guess
			win=1
		fi
		item=${maybeValidLetters[$RANDOM % ${#maybeValidLetters[@]}]} # Select a random letter
		while [[ ${already[*]} == *$item* ]] #Loop if the letter was asked already and select another letter
		do
			item=${maybeValidLetters[$RANDOM % ${#maybeValidLetters[@]}]} # Select another letter
		done
		echo "Letter > $item < in your secret word? y or n \c" ; read answer
		if [ $answer = 'y' ] ; then #If it is delete all word that there isn't that letter
			findValidletter $item # use findvalidletter
			findListLetter # Reuse function to find 
			already+=( $item )
		else
			already+=( $item ) # If not, add letter to already
		fi
		if [ ${#validLettersWords[@]} -le 3 ] && [ ${#validLettersWords[@]} -gt 0 ]; then
			win=1
		fi
	done
}

guessWord()
{
	win=0
	declare -a already
	while [ $win -eq 0 ]
	do
		item=${validLettersWords[$RANDOM % ${#validLettersWords[@]}]} # Select a random letter
		while [[ ${already[*]} == *$item* ]] #Loop if the letter was asked already and select another letter
		do
			item=${validLettersWords[$RANDOM % ${#validLettersWords[@]}]} # Select another letter
		done
		echo "Is > $item < your secret word? (y or n) \c" ; read answer
		if [ $answer = 'y' ] ; then #If it is delete all word that there isn't that letter
			echo "yeah I BEAT YOU MATE!"
			say yeah I BEAT YOU MATE
			already+=( $item )
			win=1
		else
			already+=( $item ) # If not, add letter to already
		fi
	done
}
main()
{
	n=0
	echo; echo
	echo "You need a text file, then i will read that text, you will choose a secret word of that text, and i will guess it"
	echo; echo
	echo "Enter the text file: \c"; read file  # Input the file name
	text=`cat $file` #Set variable string for the text
	echo $text

	listWord=($text) #Convert it to list of words, for guess shit

	echo "The length of your secret word: \c"; read length # Start to find the word with length hint
	findValidLength $length
	randomLetter
	guessWord
}

main








