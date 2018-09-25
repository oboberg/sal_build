# sal_build



If you have cloned this directory and it is your `PWD` the following
commands with generate the `scheduler` SAL topics based on the `master`
branches of `ts_xml`, `ts_sal`, and `ts_opensplice`,

### Build the docker image:
The docker image produced will be called `salmaker`

~~~~
bin/build_sal.sh
~~~~

### Run the docker container

You can mount a different local directory than shown here, but make sure the
mount point in the container is `/home/opsim/sal_libs`

~~~~
docker run -it --rm -v ${PWD}/sal_libs:/home/opsim/sal_libs salmaker build_topics.sh
~~~~
