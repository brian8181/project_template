NAME=$1
INFO=$2

mkdir -p ${NAME}/{src,test,man,doc}

pushd ${NAME}
touch readme readme.md news copying authors changelog
#php ./mkm.php "${NAME}" "$(date)" "version 0.0.1" > makefile

pushd src
touch ${NAME}.hpp ${NAME}.cpp ${NAME}_test.hpp ${NAME}_test.cpp
#php ./main.php "$(date)" > main.cpp

popd
popd
