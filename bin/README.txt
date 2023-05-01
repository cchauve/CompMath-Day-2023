FASTA_utils.py:     script for the manipulation of FASTA files
HyAsP_utils.py:     script for the manipulation and analysis of HyAsP results
MOB-recon_utils.py: script for the manipulation and analysis of MOB-recon results

Remarks.
In FASTA_utils.py I use the Biopython FASTA parser to parse FASTA files.
While it would be easy and as compact to use a custom parsing function,
this is more robust to use an existing standard parser.
