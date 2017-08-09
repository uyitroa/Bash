
if [ $* -eq 0 ]
then
echo "You must put an integer"
exit 1
fi

if test $* -ge 0
then
echo "$* is a postive integer"
fi

if test $* -lt 0
then
echo "$* is a negative integer"
fi