#!/bin/bash
#SBATCH --time=8:00:00
#SBATCH --mem=8G
#SBATCH --account=def-chauvec

source ../config.sh
mkdir -p ${TOOLS_DIR}

module load python/3 StdEnv/2020  gcc/9.3.0 blast+/2.12.0 mash/2.3
python3 -m venv --system-site-packages ${TOOLS_DIR}/env_mobsuite
source ${TOOLS_DIR}/env_mobsuite/bin/activate

pip3 install mob_suite==3.0.3

deactivate
