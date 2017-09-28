#!/bin/bash

# ---------------------------------------------------------------------------------- #
# 			Script to set up a Deep Learning VM on Google Cloud Platform			 #
#           ------------------------------------------------------------			 #
#Autor:             Amir Jafari, Michael Arango, Prince Birring						 #
#Date:              09/23/2017						                                 #
#Organization:      George Washington University                                     #
# INSTRUCTIONS: When you run this script, make sure you include the username 		 #
# 				associated with your instance as the first parameter. Otherwise,	 #
# 				the softwares will not work properly.   							 #
# ---------------------------------------------------------------------------------- #

# Update packages
sudo apt update
# Instal chromium browser
sudo apt install -y chromium-browser
# Download Cuda .deb file from Google Storage bucket
wget https://storage.googleapis.com/cuda-deb/cuda-repo-ubuntu1404-8-0-local-ga2_8.0.61-1_amd64.deb
# Unpack the deb file
sudo dpkg -i cuda-repo-ubuntu1404-8-0-local-ga2_8.0.61-1_amd64.deb
# Update the packages
sudo apt-get update
# Install cuda
sudo apt-get install -y cuda
# Install all required linux headers
sudo apt-get install -y linux-headers-$(uname -r)
# Remove the first line from the global environment 
sed 1d /etc/environment > /etc/environment
# Add your path to the global environment
echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/cuda-8.0/bin"' >> /etc/environment
# Execute the global environment 
source /etc/environment
# Check the version of Cuda to see it is installed
nvcc --version
# Check that the graphics card driver is installed and working with the GPU
nvidia-smi# Install libraries needed to make a virtual environment

sudo apt upgrade 
sudo apt-get install -y python-pip python-dev python-virtualenv
# Create a virtual environment, tensorflow2
virtualenv --system-site-packages python2
# Activate the virtual environment 
source ~/python2/bin/activate
# Install pip in virtual environment
easy_install -U pip
# Make sure the tensorflow package is up-to-date
sudo apt-get install -y python-pip python-dev
sudo apt-get install -y python-tk
sudo apt-get install -y python-matplotlib
sudo apt-get install -y python-pandas
sudo apt-get install -y python-sklearn
sudo apt-get install -y python-skimage
sudo apt-get install -y python-h5py
sudo apt-get install -y python-leveldb
sudo apt-get install -y python-protobuf
sudo apt-get install -y python-gflags
sudo apt-get install -y python-networkx
sudo apt-get install -y python-seaborn
sudo pip install --upgrade pip
sudo pip install --upgrade tensorflow-gpu
sudo pip install Theano
sudo pip install keras
sudo pip install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp27-cp27mu-manylinux1_x86_64.whl 
sudo pip install torchvision 
sudo pip install numpy --upgrade
 
# deactivate the virtual environment
deactivate

# ------------- Virtual Environment for Tensorflow - Python 3.5.X -------------
# Install libraries needed to make a virtual environment
sudo apt-get install -y python3-pip python3-dev python-virtualenv
# Create a virtual environment, tensorflow3
virtualenv --system-site-packages -p python3 python3
# Activate the virtual environment 
source ~/python3/bin/activate
# Install pip in virtual environment
easy_install -U pip
# Make sure the tensorflow package is up-to-date
sudo apt-get install -y python3-pip python3-dev
sudo apt-get install -y python3-tk
sudo apt-get install -y python3-pip
sudo apt-get install -y python3-matplotlib
sudo apt-get install -y python3-numpy
sudo apt-get install -y python3-pandas
sudo apt-get install -y python3-skimage
sudo apt-get install -y python3-h5py
sudo apt-get install -y python3-leveldb
sudo apt-get install -y python3-yaml
sudo pip3 install --upgrade pip
sudo pip3 install --upgrade tensorflow-gpu
sudo pip3 install pandas --upgrade
sudo pip3 install --upgrade numexpr
sudo pip3 install --upgrade numpy
sudo pip3 install Theano 
sudo pip3 install keras
sudo pip3 install protobuf
sudo pip3 install sklearn
sudo pip3 install seaborn
sudo pip3 install cython
sudo pip3 install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp35-cp35m-manylinux1_x86_64.whl 
sudo pip3 install torchvision
# deactivate the virtual environment
deactivate

sudo apt-get install -y p7zip-full
sudo apt install unzip

# ------------------------ CuDNN Installation ------------------------

# Download the CuDNN .deb file from the Google Storage bucket  
wget https://storage.googleapis.com/cuda-deb/cudnn-8.0-linux-x64-v6.0.tgz
# Untar the download file
tar -zxf cudnn-8.0-linux-x64-v6.0.tgz
# Change into the Cuda directory
cd cuda
# Copy the files from the download directory into the user directory
sudo cp lib64/* /usr/local/cuda/lib64/
sudo cp include/* /usr/local/cuda/include/
# Check to see if CuDNN is installed
cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
# Change one directory upward
cd ..

# -------------------- Python Required Package Installations --------------------

# --- Python2 pip and packages
# ------------- Virtual Environment for Tensorflow - Python 2.7.X -------------


#
## ------------------------ Pycharm Installation ------------------------
#
## Download .deb file from google storage bucket
#wget https://storage.googleapis.com/cuda-deb/pycharm-community_2016.3-mm1_all.deb
## unpack the contents
#sudo dpkg -i pycharm-community_2016.3-mm1_all.deb
#
## ------------------------ Torch Installation ------------------------
#
## install git
#sudo apt install git -y
## clone the torch github repo 
#git clone https://github.com/torch/distro.git ~/torch --recursive
## Change into the torch repo
#cd ~/torch 
## run the dependency install
#bash install-deps
## run the install script 
#./install.sh
## Change back into the root directory
#cd ..
## Execute the .bashrc script
#source ~/.bashrc
## Install the Lua package manager
#sudo apt-get install -y luarocks
## Install Lua packages in the luarocks directory
#sudo ~/torch/install/bin/luarocks install image 
#sudo ~/torch/install/bin/luarocks install nngraph
#sudo ~/torch/install/bin/luarocks install optim
#sudo ~/torch/install/bin/luarocks install nn
#sudo ~/torch/install/bin/luarocks install cutorch
#sudo ~/torch/install/bin/luarocks install cunn
#sudo ~/torch/install/bin/luarocks install cunnx
#sudo ~/torch/install/bin/luarocks install dp
## Install these packages and their dependencies, but not other recommended ones
#sudo apt-get install --no-install-recommends libhdf5-serial-dev liblmdb-dev
## Install more Lua packages/files in the luarocks directory
#sudo ~/torch/install/bin/luarocks install tds
#sudo ~/torch/install/bin/luarocks install "https://raw.github.com/deepmind/torch-hdf5/master/hdf5-0-0.rockspec"
#sudo ~/torch/install/bin/luarocks install "https://raw.github.com/Neopallium/lua-pb/master/lua-pb-scm-0.rockspec"
#sudo ~/torch/install/bin/luarocks install lightningmdb 0.9.18.1-1 LMDB_INCDIR=/usr/include LMDB_LIBDIR=/usr/lib/x86_64-linux-gnu
#sudo ~/torch/install/bin/luarocks install "httpsraw.githubusercontent.comngimelnccl.torchmasternccl-scm-1.rockspec"
## Clone the git repo of torch demos
#git clone https://github.com/torch/demos
## Install library
#sudo apt-get install gnuplot-x11
## Update libraries 
#sudo apt update
#
## ------------------------ ZeroBrane Studio Installation ------------------------
#
## Download shell script form google storage bucket
#wget https://storage.googleapis.com/cuda-deb/ZeroBraneStudioEduPack-1.60-linux.sh
## Make the script executable
#chmod +x ZeroBraneStudioEduPack-1.60-linux.sh
## Run the shell script
#./ZeroBraneStudioEduPack-1.60-linux.sh
#
## ------------------------ Caffe Installation ------------------------
#
## Install dependencies
#sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev \
#    					libopencv-dev libboost-all-dev libhdf5-serial-dev \
#    					protobuf-compiler gfortran libjpeg62 libfreeimage-dev \
#    					libatlas-base-dev git python-dev python-pip \
#    					libgoogle-glog-dev libbz2-dev libxml2-dev libxslt-dev \
#    					libffi-dev libssl-dev libgflags-dev liblmdb-dev \
#    					python-yaml python-numpy
## Install pillow
#sudo easy_install pillow
## Change to root directory
#cd ~
## Clone the BVLC Caffe repo
#git clone https://github.com/BVLC/caffe.git
## Change into the caffe repo directory
#cd caffe
## Install all python requirements in the requirements.txt file
#cat python/requirements.txt | xargs -L 1 sudo pip install
## Make a copy of the Makefile to use
#cp Makefile.config.example Makefile.config
## Uncomment the line to use CuDNN
#sed -i '/^# USE_CUDNN := 1/s/^# //' Makefile.config
## Make Caffe from the rules in the makefile using 8 cores
#make pycaffe -j8
#make all -j8
#make test -j8
## Export the path to .bashrc and source it 
#echo "export PYTHONPATH=/home/$1/caffe/python" >> ~/.bashrc
#source ~/.bashrc
## Create a link between the 2 files
#sudo ln /dev/null /dev/raw1394
## Install more python dependencies
#sudo apt-get install -y python-skimage
#sudo apt-get install -y python-pydot
#sudo apt-get install -y python-protobuf 
## Change back to the root directory
#cd ..
#