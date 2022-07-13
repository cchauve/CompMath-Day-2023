#!/bin/bash
#SBATCH --account=def-chauvec
#SBATCH --time=16:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=60000
#SBATCH --output=Efaecalis_plasmidspades-stdout.log
#SBATCH --error=Efaecalis_plasmidspades-stderr.log

module load nixpkgs/16.09
module load python/3.5.4
source $HOME/py3.5.4/bin/activate

PROJ_DIR=/project/ctb-chauvec/PLASMIDS/ARETE_PLASMIDS_PAPER
E_FAECALIS_IDS="${PROJ_DIR}/data/samples_E_faecalis_id.txt"
EXP_DIR=${PROJ_DIR}/exp/plasmidspades

DATA_DIR=/project/def-chauvec/wg-anoph
FASTQ_DIR=Plasmid_Comparison_Manuscript/Illumina_Reads_Fastq/Enterococcus_faecalis

SPADES=${EXP_DIR}/src/SPAdes-3.12.0-Linux/bin/spades.py

NUM_IDS=$(wc -l < ${E_FAECALIS_IDS})
#NUM_IDS=2

for SID in $(seq 1 $NUM_IDS);
do
	SAMPLE=$(sed -n "${SID}p" ${E_FAECALIS_IDS})
	echo ${SID} ${SAMPLE}
	RESULTS_DIR="${EXP_DIR}/results/Efaecalis/${SAMPLE}"
	mkdir -p ${RESULTS_DIR}

	cp ${DATA_DIR}/${FASTQ_DIR}/${SAMPLE}_* -d ${EXP_DIR}/tmp/
	gunzip ${EXP_DIR}/tmp/${SAMPLE}_1.fastq.gz
	gunzip ${EXP_DIR}/tmp/${SAMPLE}_2.fastq.gz

	FIRST=${EXP_DIR}/tmp/${SAMPLE}_1.fastq
	SECOND=${EXP_DIR}/tmp/${SAMPLE}_2.fastq

	echo -e "\nRunning plasmidSPAdes to determine putative plasmid contigs..."
	time python ${SPADES} --plasmid -1 ${FIRST} -2 ${SECOND} -o ${RESULTS_DIR} --careful

	echo -e "\nCleaning up..."
	rm ${FIRST} ${SECOND}
	rm ${EXP_DIR}/tmp/${SAMPLE}_*

done


