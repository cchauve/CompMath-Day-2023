#!/bin/bash
#SBATCH --time=8:00:00
#SBATCH --mem=8G
#SBATCH --account=def-chauvec
#SBATCH --job-name=create_hyasp_db
#SBATCH --output=create_database.log

source ../../config.sh
source ${TOOLS_DIR}/env_hyasp/bin/activate

# Computing the HyAsP database
hyasp create NCBI_plasmid_genes_db.fasta -p NCBI_plasmids.csv -b NCBI_blacklist.txt -d -l 500 -m 100 -t GenBank -v

# Summarizing the length of the sequences in the database
${REPO_HOME}/bin/FASTA_utils.py csv_len NCBI_plasmid_genes_db.fasta NCBI_plasmid_genes_len.csv
gzip NCBI_plasmid_genes_len.csv
