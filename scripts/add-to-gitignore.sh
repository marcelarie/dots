GIT_IGNORE_FILE_PATH=$1
FILE_TO_IGNORE=$(basename "$2")

{
	echo ""
	echo "# v Added with script v"
	echo "$FILE_TO_IGNORE" >>"$GIT_IGNORE_FILE_PATH"
	echo ""
} >>"$GIT_IGNORE_FILE_PATH"

echo "Added $FILE_TO_IGNORE to $GIT_IGNORE_FILE_PATH"
