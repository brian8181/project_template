CLASS_NAME=$1
BUILD_DATE=$(date)
VERSION="0.0.1"

~/bin/create.class.sh ${CLASS_NAME} ${LICENSE} "${AUTHOR}" "${BUILD_DATE}" ${VERSION}