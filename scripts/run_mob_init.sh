#!/bin/bash
#SBATCH --time=16:00:00
#SBATCH --mem=32G
#SBATCH --account=def-chauvec
#SBATCH --output=run_mob_init.log

source ../config.sh
mkdir -p ${TOOLS_DIR}

module load python/3 StdEnv/2020  gcc/9.3.0 blast+/2.12.0 mash/2.3
python3 -m venv ${TOOLS_DIR}/env_mobsuite
source ${TOOLS_DIR}/env_mobsuite/bin/activate

mob_init

deactivate
