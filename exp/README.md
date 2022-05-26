# Plasmids comparison paper: experiments

`hyasp_database_doi_10.15146_R33X2J__v2/`: attempt to create the HyAsP database from paper <a href="https://doi.org/10.1128/MRA.01325-18">A Curated, Comprehensive Database of Plasmid Sequences</a> (Microbiology Resource Announcements, 2019). 2022-05-26: fails.

`hyasp_database_ncbi`: create the HyAsP database from GenBank IDs, that was shown to give better results than the above one. 2022-05-26: Succeeds.

`hyasp`: rns HyAsP with the NCBI database. 2022-05-26: tested with success.  

`plasgraph`: runs plAsgraph. 2022-05-26: tested with success.  

`plasclass`: runs PlasClass. 2022-05-26: tested with success.  

`mob_recon`: runs MOB-recon.

`plasforest`: runs PlasForest.


In each dirctory, the main script to run is `process_samples.sh`, that needs to be adjusted to replace the number of jobs in the array by the number of samples.

For a given sample `SAMPLE`, the results are in the directory `results/SAMPLE/`.