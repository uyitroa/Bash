verifyUser()
{
	echo "User: $USER"
	echo 
}

checkUid()
{
	echo "UID: `id -u $USER`"
	echo 
}

answer='y'
while [ $answer = 'y' ]
do
	echo "1 - Verify existence of user"
	echo "2 - Check uid of user"
	echo "3 - quit this shit"
	read choice

	case $choice in
		1) verifyUser;;
		2) checkUid;;
		3) answer='n';;
	esac
done