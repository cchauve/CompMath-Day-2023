#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --mem=4G
#SBATCH --account=def-chauvec

source ../../config.sh
source ${TOOLS_DIR}/env_hyasp/bin/activate

# Sample ID
SAMPLE=$1
# Experiment directory
EXP_DIR=${REPO_HOME}/exp/hyasp/
# Reference database
REF_DB=${REPO_HOME}/exp/hyasp_database_doi_10.15146_R33X2J__v2/doi_10.15146_R33X2J__v2_genes.fasta
# Sample assembly graph
mkdir -p ${EXP_DIR}/tmp
cp ${REPO_HOME}/data/assembly_graphs/${SAMPLE}.gfa.gz ${EXP_DIR}/tmp/
gunzip ${EXP_DIR}/tmp/${SAMPLE}.gfa.gz
GFA=${EXP_DIR}/tmp/${SAMPLE}.gfa
# Output directory
OUT_DIR=${EXP_DIR}/results/${SAMPLE}
mkdir -p ${OUT_DIR}

hyasp map    ${REF_DB}        ${OUT_DIR}/${SAMPLE}_gcm.csv -g ${GFA}                             > ${OUT_DIR}/${SAMPLE}_log_map.txt
hyasp filter ${REF_DB}        ${OUT_DIR}/${SAMPLE}_gcm.csv ${OUT_DIR}/${SAMPLE}_filtered_gcm.csv > ${OUT_DIR}/${SAMPLE}_log_filter.txt
hyasp find   ${GFA} ${REF_DB} ${OUT_DIR}/${SAMPLE}_filtered_gcm.csv ${OUT_DIR}                   > ${OUT_DIR}/${SAMPLE}_log_find.txt
python ${REPO_HOME}/scripts/hyasp_filter_questionable_plasmids.py ${OUT_DIR}

rm ${GFA}
