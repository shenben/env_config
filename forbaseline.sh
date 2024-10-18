
apt update && apt  install docker docker.io

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://dk5x3qzp.mirror.aliyuncs.com"]
}
EOF
# {
#   "registry-mirrors": [
#     "https://registry.docker-cn.com",
#     "https://reg-mirror.qiniu.com",
#     "https://docker.mirrors.ustc.edu.cn"
#   ]
# }
sudo systemctl daemon-reload
sudo systemctl restart docker

# docker pull intel/dlstreamer-pipeline-server:2022.2.0-ubuntu20 
docker pull crpi-2hl9jg0rx83ixv3p.cn-guangzhou.personal.cr.aliyuncs.com/umsteven/dlstreamer-pipeline-server:2022.2.0-ubuntu20
git clone https://github.com/intel-iot-devkit/sample-videos.git  /tmp/sample-videos

sudo docker run -u root -p 8080:8080 -it --device /dev/dri --privileged -v /tmp/:/tmp/ -e DISPLAY=:0 --memory="3.5G" --rm crpi-2hl9jg0rx83ixv3p.cn-guangzhou.personal.cr.aliyuncs.com/umsteven/dlstreamer-pipeline-server:2022.2.0-ubuntu20