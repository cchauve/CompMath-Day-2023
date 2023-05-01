# CompMath Day 2023

## Overview

This repo serves as support for the presentation by Cedric Chauve and
Mahsa Faizrahnemoon on the use of github and jupyter notebooks for
data-science research projects.

The goal of the presentation is to introduce good practices and useful tools
that will ensure that the work you do during your project is
- understandable by you if you go back to it a few weeks/months after it was done;
- understandable by other people than you (your supervisor, your collaborators,
  other members of the lab/team after you are gone, referees for a paper based
  on your work, potential users of your code, ...);
- reproducible by someone other than you (for example with different parameters),
- ...

Basically, you want that all the efforts you have put into your work
result in something that will last beyond the very limited time
of your internship, that you or someone else can take it later and
understand it, modify it, reuse it, ...


## Resources

Achieving the goals outlines above is far from easy, and there is no way that
we can cover what it takes in the timefrane of a short presentation.

The journal <a href="https://journals.plos.org/ploscompbiol/">PLOS Computational Biology</a>
has a collection of easy to read (but not easy to apply) papers called
<a href="https://collections.plos.org/collection/ten-simple-rules/">Ten Simple Rules</a>
that contains many papers on this topic, each describing 10 simple rules
relevant to achieve some specific goals.

We recommand the following papers from this collection:  
- Organization:  <a href="https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424">A Quick Guide to Organizing Computational Biology Projects</a>  
- Reproducibility:  <a href="https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003285">Ten Simple Rules for Reproducible Computational Research</a>  
- Data:   <a href="https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005097">Ten Simple Rules for Digital Data Storage</a>  
- Notebooks:   <a href="https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004385">Ten Simple Rules for a Computational Biologist’s Laboratory Notebook</a>  
- Git:   <a href="https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004668">A Quick Introduction to Version Control with Git and GitHub</a>,  <a href="https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004947">Ten Simple Rules for Taking Advantage of Git and GitHub</a>  

## Project overview

This repo is based on the github repo of a research project in progress (with
PhD student Aniket Mane) on the comparison of bioinformatics tools for
the problem of plasmids binning, applied to a data set of genomes from
the pathogens *E. faecalis* and *E. faecium*.

**The precise details of this work are not important, as the goal of
this repo is to illustrate github and Jupyter in such a project.**

The research project aims at evaluating the accuracy of various
bioinformatics tools that analyse genomics data (genome assembly
graph) of pathogens isolates to detect plasmids (plasmid binning tools).

The elements of this project that are relevant for this presentation
are the following:
- The **data** was composed of two sets of **samples**, each representing a bacterial
  pathogen isolate, either from the *E faecalis* genus or the *E. faecium* genus.
  For each sample we were provided by our collaborators with
  - a unique **identifier**, the ID of the sample sequencing data on the
    <a href="https://www.ncbi.nlm.nih.gov/sra">NCBI SRA</a> data repository;
  - **assembly data** for each sample, in the form of two files, one in
    <a href="http://gfa-spec.github.io/GFA-spec/GFA1.html">GFA</a> format
    and one in <a href="https://www.ncbi.nlm.nih.gov/genbank/fastaformat/">FASTA</a> format;
  - a labelling of each contig in the assembly as **chromosome** or **plasmid**
    (the **ground truth** for the analysed samples).
- We processed each sample with two plasmid binning tools
  (<a href="https://github.com/cchauve/HyAsP">HyAsP</a>,
  <a href="https://github.com/phac-nml/mob-suite">MOB-recon</a>) and for each sample,
  an accuracy statistics (<a href="https://en.wikipedia.org/wiki/Precision_and_recall">F1 score</a>)
  was computed.
- The computations were conducted on a High-Performances Computing cluster,
  the cluster *cedar* of the <a href="https://alliancecan.ca">Digital research Alliance of Canada</a>
  using the <a href="https://docs.alliancecan.ca/wiki/Running_jobs">slurm scheduling system</a>.

## Files organization

This presentation will involve files present on different systems:
- all files, including large data files and results files, are on the cedar HPC systm;
- documentation, code and summary files are versioned on github.

The repo is cloned onto
- cedar, where I run all computations and updates markdown and text files;
- the <a href="https://sfu.syzygy.ca">Jupyter hub</a> of SFU that allows me
  to work on the Jupyter notebooks.

#### Remark.
The data files and results files are generally quite large and would not
be able to be versioned on github, or at the price of slowing down a lot updates.
For example, the result of creating the database of plasmid genes required by HyAsP
creates a FASTA file `NCBI_plasmid_genes_db.fasta` of 785Mb, which is too large for
github that does not accept files above 100Mb.
```
ls -l results/2022-10-01_HyAsP_database_NCBI/
total 501732
-rw-r--r-- 1 chauvec def-chauvec    201272 May  1 08:19 create_database.log
-rw-r--r-- 1 chauvec def-chauvec       605 May  1 08:21 create_database.sh
-rw-r--r-- 1 chauvec def-chauvec        75 Apr 30 11:26 NCBI_blacklist.txt
-rwxr-xr-x 1 chauvec def-chauvec 785685364 Apr 30 14:18 NCBI_plasmid_genes_db.fasta
-rw-r--r-- 1 chauvec def-chauvec   4078759 Apr 30 18:39 NCBI_plasmid_genes_len.csv.gz
-rw-r--r-- 1 chauvec def-chauvec    515971 Apr 30 11:26 NCBI_plasmids.csv.gz
-rw-r--r-- 1 chauvec def-chauvec       244 May  1 08:24 README.txt
```
To the contrary, the gzipped summary file `NCBI_plasmid_genes_len.csv.gz` that recors
the length of all sequences in the FASTA file is only 4Mb.
This will allow me to version this file and to analyze it in the lab notebook
(Lab Notebook)[./results/JOURNAL.ipynb].