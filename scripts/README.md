# ARETE Plamids Comparison Paper: scripts

`GFA_utils.py`: modification of the assembly graph and predicted plasmids to remove/add back short contigs.  


`install_hyasp.sh`: installation of HyAsP in a virtual environment env_hyasp.  

`install_plasgraph.sh`: installation of plASgraph together with a virtual environment env_plasgraph.  

`install_plasforest.sh`: installation of PlasForest together with a virtual environment env_plasforest. Was not run through sbatch as it requires some input to download the NCBI database.  

`install_scapp.sh`: installation of SCAPP wnd PlasClass ithin a virtual environment env_scapp. 

`install_mobsuite.sh`: installation of MOB-suite within a virtual environment env_mobsuite. Fails to download the database.
Attempt to download the database manually.
```
[chauvec@ccedar5.cedar.computecanada.ca] scripts > wget https://zenodo.org/record/3786915/files/data.tar.gz
--2022-05-26 14:52:45--  https://zenodo.org/record/3786915/files/data.tar.gz
Resolving zenodo.org... 137.138.76.77
Connecting to zenodo.org|137.138.76.77|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 472531123 (451M) [application/octet-stream]
Saving to: ‘data.tar.gz’

data.tar.gz                           100%[========================================================================>] 450.64M  18.6MB/s    in 33s

2022-05-26 14:53:20 (13.7 MB/s) - ‘data.tar.gz’ saved [472531123/472531123]

[chauvec@ccedar5.cedar.computecanada.ca] scripts > mv data.tar.gz /project/6069942/PLASMIDS/ARETE_PLASMIDS_PAPER/tools/env_mobsuite/lib/python3.7/site-packages/mob_suite/databases/
[chauvec@ccedar5.cedar.computecanada.ca] scripts > edit /home/chauvec/projects/ctb-chauvec/PLASMIDS/ARETE_PLASMIDS_PAPER/tools/env_mobsuite/lib/python3.7/site-packages/mob_suite/mob_init.py to comment the block of code to download the database, line 182
[chauvec@cedar5.cedar.computecanada.ca] scripts > rm /project/6069942/PLASMIDS/ARETE_PLASMIDS_PAPER/tools/env_mobsuite/lib/python3.7/site-packages/mob_suite/databases/.lock
[chauvec@cedar5.cedar.computecanada.ca] scripts > ll /project/6069942/PLASMIDS/ARETE_PLASMIDS_PAPER/tools/env_mobsuite/lib/python3.7/site-packages/mob_suite/databases/
total 443693
-rw-r--r-- 1 chauvec ctb-chauvec 472531123 May 26 05:43 data.tar.gz
-rw-r--r-- 1 chauvec ctb-chauvec         0 Nov 19  2021 __init__.py
drwxr-sr-x 2 chauvec ctb-chauvec      4096 May 26 11:47 __pycache__/
[chauvec@ccedar5.cedar.computecanada.ca] scripts > sbatch run_mob_init.sh
```
It fails again with a `segmentation fault`.