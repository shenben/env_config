#!/bin/bash

git clone https://github.com/intel-iot-devkit/sample-videos.git

# /usr/bin/time -v /home/pxg/openvino_cpp_samples_build/intel64/Release/classification_sample_async  \
#  -i /home/pxg/video_analytics/vet/SmolCat.mp4/bmp_images \
#  -m /home/pxg/video_analytics/open_model_zoo-2021.4/public/googlenet-v1/FP32/googlenet-v1.xml \
#  -d CPU

/usr/bin/time -v /root/openvino_cpp_samples_build/intel64/Release/classification_sample_async   \
 -i /tmp/traffic.mp4   \
 -m /root/env_config/googlenet-v1/FP16/googlenet-v1.xml \
 -d CPU