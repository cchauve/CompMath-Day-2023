# ARETE Plamids Comparison Paper: scripts

`GFA_utils.py`: modification of the assembly graph and predicted plasmids to remove/add back short contigs.  


`install_hyasp.sh`: installation of HyAsP in a virtual environment env_hyasp.  

`install_plasgraph.sh`: installation of plASgraph together with a virtual environment env_plasgraph.  

`install_plasforest.sh`: installation of PlasForest together with a virtual environment env_plasforest. Was not run through sbatch as it requires some input to download the NCBI database.  

`install_scapp.sh`: installation of SCAPP wnd PlasClass ithin a virtual environment env_scapp. 

`install_mobsuite.sh`: installation of MOB-suite within a virtual environment env_mobsuite. Fails to download the database.

Attempt to install MOB-suite through singularity.
```
salloc --time=8:00:00 --account=def-chauvec
[chauvec@cdr774.int.cedar.computecanada.ca] mob-suite > pwd
/home/chauvec/projects/ctb-chauvec/PLASMIDS/ARETE_PLASMIDS_PAPER/tools/mob-suite
[chauvec@cdr774.int.cedar.computecanada.ca] mob-suite > module load singularity/3.8
[chauvec@cdr774.int.cedar.computecanada.ca] mob-suite > singularity build mobsuite.sif docker://kbessonov/mob_suite:3.0.3
INFO:    Starting build...
Getting image source signatures
Copying blob 1afde3c20e44 done
Copying blob 507a3e5d452a done
Copying blob 924101922602 done
Copying blob b17db44d3d99 done
Copying blob ef1931d252eb done
Copying blob 1bafcfe169cb done
Copying blob 52ae14f15f46 done
Copying blob 461db68bc8c9 done
Copying blob 10d073049331 done
Copying blob 63267cc9eb1d done
Copying blob f5fd552a2a97 done
Copying blob 9767c2f82ac5 done
Copying blob 35c62bc43cfe done
Copying config 9cbc62c43a done
Writing manifest to image destination
Storing signatures
2022/05/26 14:22:46  info unpack layer: sha256:1afde3c20e440b7119bc6cf3b8b46e4353cfd8aaa8212bce9fcc2fb1ad58dd38
2022/05/26 14:22:50  info unpack layer: sha256:507a3e5d452adc0eb8771ea6dd22da580446b5bd8053c60dfb78a1901a0b804c
2022/05/26 14:22:50  info unpack layer: sha256:92410192260292c4dc7cb4c2fa3175f491b370fa6e1d73e5deb9a3195828de73
2022/05/26 14:22:50  info unpack layer: sha256:b17db44d3d99e7cdc91c81e287c001fed914435eda85e26f5e7f23031b802853
2022/05/26 14:22:50  info unpack layer: sha256:ef1931d252eba082e5ae34d306ada9cd4e906f1390622bdcbcd7d6b1bb3cdb79
2022/05/26 14:23:10  info unpack layer: sha256:1bafcfe169cb17aa51db91d134a17010a359d41a56fa425855e831fba25e2085
2022/05/26 14:23:12  info unpack layer: sha256:52ae14f15f4642b25f279287d2933e236f4121a6ef9b61e79de5260cebe29838
2022/05/26 14:23:12  info unpack layer: sha256:461db68bc8c90653c422b2c528649d5f4d1427a28d7d63a9074886cf430f95f4
2022/05/26 14:23:12  info unpack layer: sha256:10d073049331f74c8c4cfe5e81e5f2e56c89e6730957ba6f136941720c548cb7
2022/05/26 14:23:16  info unpack layer: sha256:63267cc9eb1dc12dfebca5f9d85156d2b70141f78ae5d61d8e8d7720ab6f6744
2022/05/26 14:23:19  info unpack layer: sha256:f5fd552a2a97cce0a4f9fba5c1e2ff137d676f6e56a46e4e9e58c1c0f7c3f4a5
2022/05/26 14:23:38  info unpack layer: sha256:9767c2f82ac5708bc5be63582bdf775292b5e1c3c35199865241b2463208a2e5
2022/05/26 14:25:32  info unpack layer: sha256:35c62bc43cfe3f86ad13cf91e7ab3ad40d286843ebb85a1eda484b0f71b43824
INFO:    Creating SIF file...
FATAL:   While performing build: while creating squashfs: create command failed: signal: killed:
[chauvec@cdr774.int.cedar.computecanada.ca] mob-suite > singularity pull docker://kbessonov/mob_suite:3.0.3
INFO:    Converting OCI blobs to SIF format
INFO:    Starting build...
Getting image source signatures
Copying blob 1afde3c20e44 skipped: already exists
Copying blob 507a3e5d452a skipped: already exists
Copying blob 924101922602 skipped: already exists
Copying blob b17db44d3d99 skipped: already exists
Copying blob ef1931d252eb skipped: already exists
Copying blob 1bafcfe169cb skipped: already exists
Copying blob 52ae14f15f46 skipped: already exists
Copying blob 461db68bc8c9 skipped: already exists
Copying blob 10d073049331 skipped: already exists
Copying blob 63267cc9eb1d skipped: already exists
Copying blob f5fd552a2a97 skipped: already exists
Copying blob 9767c2f82ac5 skipped: already exists
Copying blob 35c62bc43cfe [--------------------------------------] 0.0b / 0.0b
Copying config 9cbc62c43a done
Writing manifest to image destination
Storing signatures
2022/05/26 14:30:20  info unpack layer: sha256:1afde3c20e440b7119bc6cf3b8b46e4353cfd8aaa8212bce9fcc2fb1ad58dd38
2022/05/26 14:30:23  info unpack layer: sha256:507a3e5d452adc0eb8771ea6dd22da580446b5bd8053c60dfb78a1901a0b804c
2022/05/26 14:30:23  info unpack layer: sha256:92410192260292c4dc7cb4c2fa3175f491b370fa6e1d73e5deb9a3195828de73
2022/05/26 14:30:23  info unpack layer: sha256:b17db44d3d99e7cdc91c81e287c001fed914435eda85e26f5e7f23031b802853
2022/05/26 14:30:23  info unpack layer: sha256:ef1931d252eba082e5ae34d306ada9cd4e906f1390622bdcbcd7d6b1bb3cdb79
2022/05/26 14:30:43  info unpack layer: sha256:1bafcfe169cb17aa51db91d134a17010a359d41a56fa425855e831fba25e2085
2022/05/26 14:30:45  info unpack layer: sha256:52ae14f15f4642b25f279287d2933e236f4121a6ef9b61e79de5260cebe29838
2022/05/26 14:30:45  info unpack layer: sha256:461db68bc8c90653c422b2c528649d5f4d1427a28d7d63a9074886cf430f95f4
2022/05/26 14:30:45  info unpack layer: sha256:10d073049331f74c8c4cfe5e81e5f2e56c89e6730957ba6f136941720c548cb7
2022/05/26 14:30:49  info unpack layer: sha256:63267cc9eb1dc12dfebca5f9d85156d2b70141f78ae5d61d8e8d7720ab6f6744
2022/05/26 14:30:52  info unpack layer: sha256:f5fd552a2a97cce0a4f9fba5c1e2ff137d676f6e56a46e4e9e58c1c0f7c3f4a5
2022/05/26 14:31:10  info unpack layer: sha256:9767c2f82ac5708bc5be63582bdf775292b5e1c3c35199865241b2463208a2e5
2022/05/26 14:33:02  info unpack layer: sha256:35c62bc43cfe3f86ad13cf91e7ab3ad40d286843ebb85a1eda484b0f71b43824
INFO:    Creating SIF file...
FATAL:   While making image from oci registry: error fetching image to cache: while building SIF from layers: while creating squashfs: create command failed: signal: killed:

