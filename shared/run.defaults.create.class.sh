NAME=$1
LICENSE="None"
AUTHOR="Brian K Preston"
FILE_NAME=$2
BUILD_DATE=$(date)
VERSION="0.0.1"

~/bin/create.class.sh ${NAME} "." "." ${LICENSE} "${AUTHOR}" "${BUILD_DATE}" ${VERSION} $FILE_NAME