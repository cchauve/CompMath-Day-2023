#!/bin/bash

# Environment variables
source ../../config.sh

# HERE should be some code that will generate from
# - the results obtained by HyAsP,
# - the files ${REPO_HOME}/data/2022-10-02/E_faecalis_samples.txt ${REPO_HOME}/data/2022-10-02/E_faecium_samples.txt
# two log files, one per data set recording for each sample if the computation was error-free or had some error
# and
# two CSV files, one per data set, that records the F1 value for every sample:
# - E_faecalis_HyAsP_F1.csv, E_faecium_HyAsP_F1.csv
#
# It would likely use a python script ${REPO_HOME}/bin/HyAsP_utils.py
