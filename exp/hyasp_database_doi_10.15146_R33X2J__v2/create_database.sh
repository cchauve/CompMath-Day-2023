#!/bin/bash
#SBATCH --time=8:00:00
#SBATCH --mem=8G
#SBATCH --account=def-chauvec

source ../../config.sh
source ${TOOLS_DIR}/env_hyasp/bin/activate
hyasp create doi_10.15146_R33X2J__v2_genes.fasta -a doi_10.15146_R33X2J__v2_id.txt -k doi_10.15146_R33X2J__v2_plasmids.fa -d -l 500 -m 100 -v 
