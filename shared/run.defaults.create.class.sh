CLASS_NAME=$1
LICENSE="None"
AUTHOR="Brian K Preston"
FILE_NAME=$2
BUILD_DATE=$(date)
VERSION="0.0.1"

~/bin/create.class.sh ${CLASS_NAME} "." "." ${LICENSE} "${AUTHOR}" "${BUILD_DATE}" ${VERSION} $FILE_NAME