#!/bin/bash
#SBATCH --gres=gpu:1 
#SBATCH --cpus-per-task=6 
#SBATCH --mem=32000M       
#SBATCH --time=1:00:00
#SBATCH --account=def-chauvec
#SBATCH --array=1-2
#SBATCH --output=PlasForest_%A_%a.log
#SBATCH --job-name=plasforest

# Environment variables
source ../../config.sh
## Sample ID
SAMPLE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" ${REPO_HOME}/data/samples_id.txt)
## Experiment and output directory
EXP_DIR=${REPO_HOME}/exp/plasforest
OUT_DIR=${EXP_DIR}/results/${SAMPLE}
mkdir -p ${OUT_DIR}

# Preparing input: assembly graph
cp ${REPO_HOME}/data/assembly_contigs/${SAMPLE}.scaffolds.fa.gz ${EXP_DIR}/tmp
gunzip ${EXP_DIR}/tmp/${SAMPLE}.scaffolds.fa.gz
FA=${EXP_DIR}/tmp/${SAMPLE}.scaffolds.fa

# Running PlasForest
module load StdEnv/2020  gcc/9.3.0 blast+/2.12.0
source ${TOOLS_DIR}/env_plasforest/bin/activate
cd ${TOOLS_DIR}/PlasForest
python PlasForest.py -i ${FA} -o ${OUT_DIR}/${SAMPLE}_plasforest.csv -f -v --threads 6

# Cleaning
rm ${FA}
