#!/bin/bash
#SBATCH --time=8:00:00
#SBATCH --mem=8G
#SBATCH --account=def-chauvec
#SBATCH --output=install_plasgraph.log

source ../config.sh
mkdir -p ${TOOLS_DIR}

module load python/3
python3 -m venv ${TOOLS_DIR}/env_plasgraph
source ${TOOLS_DIR}/env_plasgraph/bin/activate

pip install 'networkx>=2.6.3'
pip install 'pandas>=1.3.5'
pip install 'numpy>=1.21.5'
pip install 'scikit-learn>=0.23.1'
pip install 'biopython>=1.79'
pip install 'matplotlib>=3.5.1'
pip install --no-index 'tensorflow>=2.8'
pip install 'spektral>=1.0.8'
pip install 'scipy>=1.4.1'

cd ${TOOLS_DIR}
git clone https://github.com/cchauve/plASgraph.git

deactivate
