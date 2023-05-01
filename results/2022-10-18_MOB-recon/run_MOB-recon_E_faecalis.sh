#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --mem=4G
#SBATCH --account=def-chauvec
#SBATCH --array=1-56
#SBATCH --output=slurm_log/MOB-recon_E_faecalis_%A_%a.log
#SBATCH --error=slurm_log/MOB-recon_E_faecalis_%A_%a.err
#SBATCH --job-name=MOB_E_faecalis

# Environment variables
source ../../config.sh

## Sample ID
SAMPLE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" ${REPO_HOME}/data/2022-10-02_E_faecalis/E_faecalis_samples.txt)
## Experiment and output directory
EXP_DIR=${REPO_HOME}/results/2022-10-18_MOB-recon
OUT_DIR=${EXP_DIR}/results/${SAMPLE}
mkdir -p ${OUT_DIR}

# Preparing input
## Sample assembly contigs
mkdir -p ${EXP_DIR}/tmp
cp ${REPO_HOME}/data/2022-10-02_E_faecalis/${SAMPLE}.fa.gz ${EXP_DIR}/tmp/
gunzip ${EXP_DIR}/tmp/${SAMPLE}.fa.gz
FA=${EXP_DIR}/tmp/${SAMPLE}.fa

# Running MOB-recon
source ${TOOLS_DIR}/env_mobsuite/bin/activate
module load StdEnv/2020  gcc/9.3.0 blast+/2.12.0 mash
mob_recon --infile ${FA} --outdir ${OUT_DIR}

# Cleaning
rm ${FA}

