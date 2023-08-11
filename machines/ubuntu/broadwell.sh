BASE=$HOME/USQCD
STACK="qmp qdpxx chroma"

# We used apt-get to install
# libxml2-dev
# hdf5-dev #! Jinchen: apt use "hdf5-tools" instead
# hdf5-utils
# autoconf
# autotools

INSTALL[libxml2]=/usr
INSTALL[hdf5]=/usr/include/hdf5/openmpi

# It took a little while to figure out that ubuntu's apt-get didn't install all the HDF5 things into /some/folder/to/hdf5/{lib,include} but rather (at least if you use mpich)
# hides them in other places.  This is why we explicitly add the -I/usr/include/hdf5/mpich to the flags.

export CC=/usr/bin/mpicc
C_FLAGS[DEFAULT]="-O3 -march=broadwell -fpermissive -fopenmp -I/usr/include/hdf5/openmpi"

export CXX=/usr/bin/mpicxx
CXX_FLAGS[DEFAULT]="-O3 -std=c++11 -march=broadwell -ffast-math -funroll-all-loops -fpermissive -fopenmp -I/usr/include/hdf5/openmpi"

# >>> hdf5 >>>
export C_INCLUDE_PATH="/usr/include/hdf5/openmpi:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="/usr/include/hdf5/openmpi:$CPLUS_INCLUDE_PATH"
# <<< hdf5 <<<


# No zmuldefs.
# export LD_LIBRARY_PATH=/home/jinchen/USQCD/install/qmp/lib:$LD_LIBRARY_PATH
# export LIBRARY_PATH=/home/jinchen/USQCD/install/qmp/lib:$LIBRARY_PATH

LD_FLAGS[chroma]='${LD_FLAGS[DEFAULT]} -L/usr/lib/x86_64-linux-gnu/hdf5/openmpi'
LD_FLAGS[chroma_single]='${LD_FLAGS[DEFAULT]}'

LD_FLAGS[qdpxx]+=' -L/usr/local/openmpi/lib '
LD_FLAGS[qdpxx]+=' -L/home/jinchen/USQCD/build/qdpxx/other_libs/qio/lib '

