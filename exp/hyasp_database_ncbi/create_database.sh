#!/bin/bash
#SBATCH --time=8:00:00
#SBATCH --mem=8G
#SBATCH --account=def-chauvec
#SBATCH --job-name=create_hyasp_db
#SBATCH --output=create_database.log

source ../../config.sh
source ${TOOLS_DIR}/env_hyasp/bin/activate
hyasp create ncbi_database_genes.fasta -p plasmids.csv -b ncbi_blacklist.txt -d -l 500 -m 100 -t GenBank -v
