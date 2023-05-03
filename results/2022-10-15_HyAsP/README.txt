# Processing the E faecalis and E faecium samples with HyAsP, using the HyAsP NCBI database.

Slurm commands to run HyAsP:
sbatch run_HyAsP_E_faecalis.sh
sbatch run_HyAsP_E_faecium.sh

In terms of writing, there is q lot of duplication between these two scripts
and a better approach would be to have a unique template script that can be
parameterized with an input file. 

Once all slurm processes are over, the results are checked and summarized with
./summarize.sh

This creates the files E_faecalis_HyAsP_F1.csv and E_faecium_HyAsP_F1.csv
that contain the F1 value (accuracy measure) for each sample. leaving te F1 field
empty if no plasmid was predicted.