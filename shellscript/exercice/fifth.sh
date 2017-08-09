enable -n echo
declare -a files
echo "List of files to compress: \c"; read -a files

chrlen=${#files[@]}

echo "Method:"
echo "1)Gunzip     2)Bunzip      3)Unzip     4)Tar"
read choice

if [ $choice -eq 1 ]; then
	
	for (( i = 0 ; i < $chrlen ; i++ ))
	do
		gunzip ${files[$i]}
	done
fi

if [ $choice -eq 2 ]; then
	for (( i = 0 ; i < $chrlen ; i++ ))
	do
		bunzip2 ${files[$i]}
	done
fi

if [ $choice -eq 3 ]; then
	for (( i = 0 ; i < $chrlen ; i++ ))
	do
		unzip ${files[$i]}
	done
fi
if [ $choice -eq 4 ]; then
	for (( i = 0 ; i < $chrlen ; i++ ))
	do
		tar -zxvf ${files[$i]}
	done
fi