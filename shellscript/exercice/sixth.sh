file=`ls -lah ~ | awk '{print $5}'`
arr=($file)
chrlen=${#arr[@]}
declare -a list
for (( i = 0 ; i < $chrlen ; i++ ))
do
	if [[ ${arr[$i]} == *"B"* ]] ; then 
			idk=idk
	else
		if [[ ${arr[$i]} == *"K"* ]] ; then
			bar=${arr[$i]/K/ }
			int=${bar%.*}
			if [ $int -gt 100 ] ; then
				list+=(${arr[$i]})
			fi
		else
			list+=(${arr[$i]})
		fi
	fi
done
echo ${list[*]}