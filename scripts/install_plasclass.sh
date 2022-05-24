#!/bin/bash
#SBATCH --time=8:00:00
#SBATCH --mem=8G
#SBATCH --account=def-chauvec

source ../config.sh
mkdir -p ${TOOLS_DIR}

module load python/3
python3 -m venv --system-site-packages ${TOOLS_DIR}/env_plasclass
source ${TOOLS_DIR}/env_plasclass/bin/activate
pip install cython

cd ${TOOLS_DIR}
git clone https://github.com/Shamir-Lab/PlasClass.git
cd PlasClass
python setup.py install --user

deactivate
