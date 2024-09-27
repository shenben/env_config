#!/bin/bash

apt update && apt install sudo

sudo apt install -y build-essential autoconf software-properties-common apt-transport-https wget  cmake libboost-all-dev vim git curl  opencv-dev

wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
echo "deb https://apt.repos.intel.com/oneapi all main" | sudo tee /etc/apt/sources.list.d/oneAPI.list
sudo apt update
sudo apt install -y libgl1-mesa-glx pkg-config intel-oneapi-vtune

# download_OpenVINO_2024 
curl -L https://storage.openvinotoolkit.org/repositories/openvino/packages/2024.3/linux/l_openvino_toolkit_ubuntu22_2024.3.0.16041.1e3b88e4e3f_x86_64.tgz --output openvino_2024.3.0.tgz
tar -xf openvino_2024.3.0.tgz
sudo mv l_openvino_toolkit_ubuntu22_2024.3.0.16041.1e3b88e4e3f_x86_64 /opt/intel/openvino_2024.3.0
cd /opt/intel/openvino_2024.3.0
sudo -E ./install_dependencies/install_openvino_dependencies.sh
source /opt/intel/openvino_2024.3.0/setupvars.sh

mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

~/miniconda3/bin/conda init bash
# ~/miniconda3/bin/conda init zsh