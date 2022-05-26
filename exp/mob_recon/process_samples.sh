#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --mem=4G
#SBATCH --account=def-chauvec
#SBATCH --array=1-2
#SBATCH --output=MOB-recon_%A_%a.log
#SBATCH --job-name=MOB-recon

# Environment variables
source ../../config.sh
## Sample ID
SAMPLE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" ${REPO_HOME}/data/samples_id.txt)
## Experiment and output directory
EXP_DIR=${REPO_HOME}/exp/mob_recon/
OUT_DIR=${EXP_DIR}/results/${SAMPLE}
mkdir -p ${OUT_DIR}

# Preparing input
## Sample assembly contigs
mkdir -p ${EXP_DIR}/tmp
cp ${REPO_HOME}/data/assembly_contigs/${SAMPLE}.scaffolds.fa.gz ${EXP_DIR}/tmp/
gunzip ${EXP_DIR}/tmp/${SAMPLE}.scaffolds.fa.gz
FA=${EXP_DIR}/tmp/${SAMPLE}.scaffolds.fa

# Running MOB-recon
source ${TOOLS_DIR}/env_mobsuite/bin/activate
module load StdEnv/2020  gcc/9.3.0 blast+/2.12.0 mash
mob_recon --infile ${FA} --outdir ${OUT_DIR}

# Cleaning
rm ${FA}
