INPUT_PATH=~/bin
OUTPUT_PATH=.

for i in "$@"; do

echo $i
CLASS_NAME=$i
${INPUT_PATH}/create.class.sh ${CLASS_NAME}

done
