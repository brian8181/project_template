INPUT_PATH=~/bin
OUTPUT_PATH=.

for i in "$@"; do

CLASS_NAME=$i
${INPUT_PATH}/create.class.sh ${CLASS_NAME} ${BASE_CLASS_NAME}

done
