cd build_chrono
cmake .. -D EIGEN3_INCLUDE_DIR=/home/gridsan/aryag/local_installs/eigen-3.4.0 -D CMAKE_INSTALL_PREFIX=/home/gridsan/aryag/local_installs
make -j 48
make install
cd ..