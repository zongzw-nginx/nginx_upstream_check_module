HOMEDIR=`cd $(dirname $0); pwd`
VERSION=1.21.1

nginx-build \
    -d $HOMEDIR/nginx-builds \
    -v $VERSION \
    --patch $HOMEDIR/check_1.16.1+.patch \
    -patch-opt "-p1" \
    --add-module=$HOMEDIR \
    --prefix=$HOMEDIR/execs

make -C $HOMEDIR/nginx-builds/nginx/$VERSION/nginx-$VERSION install

rm -f $HOMEDIR/execs/conf/nginx.conf
ln -s $HOMEDIR/nginx.conf $HOMEDIR/execs/conf/nginx.conf