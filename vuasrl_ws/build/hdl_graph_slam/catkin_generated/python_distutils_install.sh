#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/kimjaen/vuasrl_ws/src/hdl_graph_slam"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/kimjaen/vuasrl_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/kimjaen/vuasrl_ws/install/lib/python3/dist-packages:/home/kimjaen/vuasrl_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/kimjaen/vuasrl_ws/build" \
    "/usr/bin/python3" \
    "/home/kimjaen/vuasrl_ws/src/hdl_graph_slam/setup.py" \
    egg_info --egg-base /home/kimjaen/vuasrl_ws/build/hdl_graph_slam \
    build --build-base "/home/kimjaen/vuasrl_ws/build/hdl_graph_slam" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/kimjaen/vuasrl_ws/install" --install-scripts="/home/kimjaen/vuasrl_ws/install/bin"
