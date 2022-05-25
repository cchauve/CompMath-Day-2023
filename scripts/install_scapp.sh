#!/bin/bash
#SBATCH --time=8:00:00
#SBATCH --mem=8G
#SBATCH --account=def-chauvec
#SBATCH --output=install_scapp.log

source ../config.sh
mkdir -p ${TOOLS_DIR}

module load python/3 StdEnv/2020  gcc/9.3.0 blast+/2.12.0 bwa samtools
python3 -m venv --system-site-packages ${TOOLS_DIR}/env_scapp
source ${TOOLS_DIR}/env_scapp/bin/activate

cd ${TOOLS_DIR}
git clone https://github.com/Shamir-Lab/SCAPP.git
cd SCAPP
python setup.py install --user

deactivate
