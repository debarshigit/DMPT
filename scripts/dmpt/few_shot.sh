#!/bin/bash

# custom config
DATA="/path/to/dataset/folder"

TRAINER=DMPT

DATASET=$1
CFG=vit_b16_c2_ep50_batch4_2ctx_few_shot
SHOTS=$2
# DEVICE=$3

for SEED in 1 2 3
do
    
    DIR=output/${DATASET}/Maple_Original/${CFG}_${SHOTS}shots/seed${SEED}
    if [ -d "$DIR" ]; then
        echo " The results exist at ${DIR}"
    else
        echo "Run this job and save the output to ${DIR}"
        python train.py \
        --root ${DATA} \
        --seed ${SEED} \
        --trainer ${TRAINER} \
        --dataset-config-file configs/datasets/${DATASET}.yaml \
        --config-file configs/trainers/${TRAINER}/${CFG}.yaml \
        --output-dir ${DIR} \
        DATASET.NUM_SHOTS ${SHOTS}
    fi
done
