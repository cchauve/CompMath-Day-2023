# Processing the E faecalis and E faecium samples with MOB-recon

Slurm commands:
sbatch run_MOB-recon_E_faecalis.sh
sbatch run_MOB-recon_E_faecium.sh

Once all slurm processes are over, the results are checked and summarized
./summarize.sh

This creates the files E_faecalis_MOB-recon_F1.csv and E_faecium_MOB-recon_F1.csv
that contain the F1 value (accuracy measure) for each sample. leaving te F1 field
empty if no plasmid was predicted.