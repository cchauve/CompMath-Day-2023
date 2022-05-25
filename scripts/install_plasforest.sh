#!/bin/bash
#SBATCH --time=8:00:00
#SBATCH --mem=8G
#SBATCH --account=def-chauvec
#SBATCH --output=install_plasforest.log

source ../config.sh
mkdir -p ${TOOLS_DIR}

module load python/3 StdEnv/2020  gcc/9.3.0 blast+/2.12.0
python3 -m venv --system-site-packages ${TOOLS_DIR}/env_plasforest
source ${TOOLS_DIR}/env_plasforest/bin/activate

pip install numpy
pip install pandas
pip install biopython
pip install scikit-learn==0.22.2.post1
pip install joblib

cd ${TOOLS_DIR}
git clone https://github.com/leaemiliepradier/PlasForest.git
cd PlasForest
tar -zxvf plasforest.sav.tar.gz
chmod 755 database_downloader.sh
./database_downloader.sh

deactivate
