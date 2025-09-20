NAME=$1
INFO=$2

mkdir -p ${NAME}/{src,test,man,doc}
pushd $NAME

touch readme readme.md news copying authors changelog
php ~/bin/skel/makefile.php "${NAME}" "$(date)" "version 0.0.1" > makefile

pushd ./src
touch ${NAME}.hpp ${NAME}.cpp ${NAME}_test.hpp ${NAME}_test.cpp
php ~/bin/skel/main_cpp.php "$(date)" > main.cpp
php ~/bin/skel/app_hpp.php "${NAME}" "$(date)" > ${NAME}.hpp
php ~/bin/skel/app_cpp.php "${NAME}" "$(date)" > ${NAME}.cpp

popd
popd
