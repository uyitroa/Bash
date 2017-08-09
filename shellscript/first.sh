#My first shell's script

clear
echo "Hello, this is my first frecking script"

echo "I am" "\c" ; whoami
echo "Today is" "\c" ; date
echo "Calendar:";cal

echo $HOME

test="ok"
echo $test

myname=$LOGNAME
echo $myname

expr 1 + 3
expr 2134 \* 23

echo "Expression 1 + 3 is" "\c"; expr 1 + 3

echo "Today is `date`"

a=`expr 1 + 3`
echo "Just do it:" $a