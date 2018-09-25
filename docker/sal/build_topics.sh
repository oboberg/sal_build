#!/bin/sh

# set -e

DEFAULT_TS_OPENPLICE="master"
DEFAULT_TS_XML="master"
DEFAULT_TS_SAL="master"

usage() {
  cat << EOD

  Available options:
    -o          Version for the ts_opensplice. Defaults to $DEFAULT_TS_OPENPLICE
    -x          Version for the ts_xml. Defaults to $DEFAULT_TS_XML
    -s          Version for the ts_sal. Defaults to $DEFAULT_TS_SAL
    -h          This message
EOD
}

# get the options
while getopts ho:s:x: c; do
    case $c in
            h) usage ; exit 0 ;;
            o) TS_OPENPLICE="$OPTARG" ;;
            x) TS_XML="$OPTARG" ;;
            s) TS_SAL="$OPTARG" ;;
            \?) usage ; exit 2 ;;
    esac
done

shift "$((OPTIND-1))"
if [ $# -ne 0 ] ; then
    usage
    exit 2
fi

if [ -z $TS_OPENPLICE ] ; then
    TS_OPENPLICE=$DEFAULT_TS_OPENPLICE
fi

if [ -z $TS_XML ] ; then
    TS_XML=$DEFAULT_TS_XML
fi

if [ -z $TS_SAL ] ; then
    TS_SAL=$DEFAULT_TS_SAL
fi

cd /home/opsim/

/home/opsim/sal_libs=$DIRECTORY

if [ ! -d "$DIRECTORY" ]; then
  mkdir /home/opsim/sal_libs
fi

source /home/opsim/dds/setup.env

cd /home/opsim/repos/ts_opensplice
git pull
git checkout $TS_OPENPLICE

cd /home/opsim/repos/ts_xml
git pull
git checkout $TS_XML

cd /home/opsim/repos/ts_sal
git pull
git checkout $TS_SAL

cd /home/opsim

cp /home/opsim/repos/ts_xml/sal_interfaces/scheduler/*.xml /home/opsim/repos/ts_sal/test/.

cd /home/opsim/repos/ts_sal/test/
salgenerator scheduler validate
salgenerator scheduler sal cpp
salgenerator scheduler sal python

cd /home/opsim

cp /home/opsim/repos/ts_sal/test/scheduler/cpp/src/SALPY_scheduler.so /home/opsim/sal_libs/.
cp /home/opsim/repos/ts_sal/test/scheduler/cpp/libsacpp_scheduler_types.so /home/opsim/sal_libs/.
