#!/bin/bash

docker run -v `pwd`:/workspace -p 8888:8888 -it sprout/data-science /bin/bash -c "jupyter-lab --notebook-dir=/workspace --ip='0.0.0.0' --port=8888 --no-browser --allow-root"
