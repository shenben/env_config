#!/bin/bash

apt update && apt install sudo

sudo apt install -y build-essential autoconf software-properties-common apt-transport-https wget  cmake libboost-all-dev vim git curl 

# wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
# sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
# echo "deb https://apt.repos.intel.com/oneapi all main" | sudo tee /etc/apt/sources.list.d/oneAPI.list
# sudo apt update
# sudo apt install libgl1-mesa-glx pkg-config intel-oneapi-vtune

# download_OpenVINO_2024 
curl -L https://storage.openvinotoolkit.org/repositories/openvino/packages/2024.3/linux/l_openvino_toolkit_ubuntu22_2024.3.0.16041.1e3b88e4e3f_x86_64.tgz --output openvino_2024.3.0.tgz
tar -xf openvino_2024.3.0.tgz
sudo mv l_openvino_toolkit_ubuntu22_2024.3.0.16041.1e3b88e4e3f_x86_64 /opt/intel/openvino_2024.3.0
cd /opt/intel/openvino_2024.3.0
sudo -E ./install_dependencies/install_openvino_dependencies.sh
source /opt/intel/openvino_2024.3.0/setupvars.sh


# mkdir -p ~/miniconda3
# wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.9.2-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
# bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3

git clone https://github.com/oneapi-src/oneAPI-samples.git
pip install matplotlib py-cpuinfo intel_extension_for_pytorch==1.13.100 torch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 transformers transformers sentencepiece sacremoses

wget https://registrationcenter-download.intel.com/akdlm/IRC_NAS/d7e1fdb1-cfc7-40fb-bf46-3719e9372d67/l_oneapi_vtune_p_2024.3.0.31_offline.sh
sudo sh ./l_oneapi_vtune_p_2024.3.0.31_offline.sh

sudo apt-get install libatk1.0-0 libatk-bridge2.0-0 libgtk-3-0 libgbm1 #vtune-gui dependencies