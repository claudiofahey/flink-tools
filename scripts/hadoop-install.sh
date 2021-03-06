#!/usr/bin/env bash
# Copyright (c) Dell Inc., or its subsidiaries. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
set -ex
ROOT_DIR=$(dirname $0)/..
source ${ROOT_DIR}/scripts/env.sh
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm upgrade --install --timeout 600s --wait --debug \
    hadoop \
    --namespace ${NAMESPACE} \
    stable/hadoop \
    $@
