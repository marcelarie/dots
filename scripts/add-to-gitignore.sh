GIT_IGNORE_FILE_PATH=$1
FILE_TO_IGNORE=$(basename "$2")

if [ -z "$GIT_IGNORE_FILE_PATH" ] || [ -z "$FILE_TO_IGNORE" ]; then
    echo "Git ignore file path or file to ignore is not specified"
    exit 1
fi

if [ ! -f "$GIT_IGNORE_FILE_PATH" ]; then
	echo "File $GIT_IGNORE_FILE_PATH does not exist"
	exit 1
fi

{
    echo -e "\n# v Added with script v\n$FILE_TO_IGNORE\n"
} >> "$GIT_IGNORE_FILE_PATH"

echo "Added $FILE_TO_IGNORE to $GIT_IGNORE_FILE_PATH"
