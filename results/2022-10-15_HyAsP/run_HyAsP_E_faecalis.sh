#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --mem=4G
#SBATCH --account=def-chauvec
#SBATCH --array=1-56
#SBATCH --output=slurm_log/HyAsP_E_faecalis_%A_%a.log
#SBATCH --error=slurm_log/HyAsP_E_faecalis_%A_%a.err
#SBATCH --job-name=HyAsP_E_faecalis

# Environment variables
source ../../config.sh
## Sample ID
SAMPLE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" ${REPO_HOME}/data/2022-10-02_E_faecalis/E_faecalis_samples.txt)
## Experiment and output directory
EXP_DIR=${REPO_HOME}/results/2022-10-15_HyAsP
OUT_DIR=${EXP_DIR}/${SAMPLE}
mkdir -p ${OUT_DIR}

# Preparing input
## Reference database
REF_DB=${REPO_HOME}/results/2022-10-14_HyAsP_database_NCBI/NCBI_plasmid_genes_db.fasta
## Sample assembly graph
mkdir -p ${EXP_DIR}/tmp
cp ${REPO_HOME}/data/2022-10-02_E_faecalis/${SAMPLE}.gfa.gz ${EXP_DIR}/tmp/
gunzip ${EXP_DIR}/tmp/${SAMPLE}.gfa.gz
GFA=${EXP_DIR}/tmp/${SAMPLE}.gfa

# Running HyAsP
source ${TOOLS_DIR}/env_hyasp/bin/activate
module load StdEnv/2020  gcc/9.3.0 blast+/2.12.0
hyasp map    ${REF_DB}        ${OUT_DIR}/${SAMPLE}_gcm.csv -g ${GFA}                             > ${OUT_DIR}/${SAMPLE}_log_map.txt
hyasp filter ${REF_DB}        ${OUT_DIR}/${SAMPLE}_gcm.csv ${OUT_DIR}/${SAMPLE}_filtered_gcm.csv > ${OUT_DIR}/${SAMPLE}_log_filter.txt
hyasp find   ${GFA} ${REF_DB} ${OUT_DIR}/${SAMPLE}_filtered_gcm.csv ${OUT_DIR}                   > ${OUT_DIR}/${SAMPLE}_log_find.txt

# Cleaning
rm ${GFA}
