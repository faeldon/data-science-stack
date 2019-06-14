#!/bin/bash

sed -e "s/DATABRICKS_HOST/$DATABRICKS_HOST/" \
    -e "s/DATABRICKS_CLUSTER_ID/$DATABRICKS_CLUSTER_ID/" \
    -e "s/DATABRICKS_ORG_ID/$DATABRICKS_ORG_ID/" \
    -e "s/DATABRICKS_PORT/$DATABRICKS_PORT/" \
    -e "s/DATABRICKS_TOKEN/$DATABRICKS_TOKEN/" \
    -i /root/.databricks-connect

jupyter-notebook --notebook-dir=/workspace --ip='0.0.0.0' --port=8888 --no-browser --allow-root
