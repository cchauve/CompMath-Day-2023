#!/bin/bash
#SBATCH --gres=gpu:1 
#SBATCH --cpus-per-task=6 
#SBATCH --mem=32000M       
#SBATCH --time=1:00:00
#SBATCH --account=def-chauvec

source ../../config.sh
source ${TOOLS_DIR/env_plasgraph/bin/activate

# Sample ID
SAMPLE=$1
# Going into the plasgraph directory
cd ${TOOLS_DIR}/plASgraph
# Experiment directory
EXP_DIR=${REPO_HOME}/exp/plasgraph
# Input
cp ${REPO_HOME}/data/assembly_graphs/${SAMPLE}.gfa.gz ${EXP_DIR}/tmp
gunzip ${EXP_DIR}/tmp/${SAMPLE}.gfa.gz
GFA=${EXP_DIR}/tmp/${SAMPLE}.gfa

# Running plASgraph
OUT_DIR=${EXP_DIR}/results/${SAMPLE}
mkdir -p ${OUT_DIR}
python plASgraph.py -i ${GFA} -o ${OUT_DIR}/${SAMPLE}_class.csv --draw_graph

rm ${GFA}
