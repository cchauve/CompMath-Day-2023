#!/bin/bash
#SBATCH --time=8:00:00
#SBATCH --mem=8G
#SBATCH --account=def-chauvec

source ../config.sh
mkdir -p ${TOOLS_DIR}

module load python/3 StdEnv/2020  gcc/9.3.0 blast+/2.12.0
python3 -m venv --system-site-packages ${TOOLS_DIR}/env_hyasp
source ${TOOLS_DIR}/env_hyasp/bin/activate

pip install numpy
pip install pandas
pip install biopython

cd ${TOOLS_DIR}
git clone https://github.com/cchauve/hyasp.git
cd hyasp
python setup.py sdist
pip install dist/HyAsP-1.0.0.tar.gz

deactivate
