rm -rf results
if [[ $1 == ./* ]];
then
    robot -d ../results $1
else
    robot --test "$1" -d ../results .
fi
