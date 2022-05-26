#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --mem=4G
#SBATCH --account=def-chauvec
#SBATCH --array=1-2
#SBATCH --output=HyAsP_%A_%a.log
#SBATCH --job-name=hyasp

# Environment variables
source ../../config.sh
## Sample ID
SAMPLE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" ${REPO_HOME}/data/samples_id.txt)
## Experiment and output directory
EXP_DIR=${REPO_HOME}/exp/hyasp/
OUT_DIR=${EXP_DIR}/results/${SAMPLE}
mkdir -p ${OUT_DIR}

# Preparing input
## Reference database
REF_DB=${REPO_HOME}/exp/hyasp_database_ncbi/ncbi_database_genes.fasta
## Sample assembly graph
mkdir -p ${EXP_DIR}/tmp
cp ${REPO_HOME}/data/assembly_graphs/${SAMPLE}.assembly.gfa.gz ${EXP_DIR}/tmp/
gunzip ${EXP_DIR}/tmp/${SAMPLE}.assembly.gfa.gz
GFA=${EXP_DIR}/tmp/${SAMPLE}.assembly.gfa

# Running HyAsP
source ${TOOLS_DIR}/env_hyasp/bin/activate
module load StdEnv/2020  gcc/9.3.0 blast+/2.12.0
hyasp map    ${REF_DB}        ${OUT_DIR}/${SAMPLE}_gcm.csv -g ${GFA}                             > ${OUT_DIR}/${SAMPLE}_log_map.txt
hyasp filter ${REF_DB}        ${OUT_DIR}/${SAMPLE}_gcm.csv ${OUT_DIR}/${SAMPLE}_filtered_gcm.csv > ${OUT_DIR}/${SAMPLE}_log_filter.txt
hyasp find   ${GFA} ${REF_DB} ${OUT_DIR}/${SAMPLE}_filtered_gcm.csv ${OUT_DIR}                   > ${OUT_DIR}/${SAMPLE}_log_find.txt
python ${REPO_HOME}/scripts/hyasp_filter_questionable_plasmids.py ${OUT_DIR}

# Cleaning
rm ${GFA}
