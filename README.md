# CompMath Day 2023

## Overview

This repo serves as support for the presentation by Cedric Chauve and
Mahsa Faizrahnemoon on the use of github and jupyter notebooks for
data-science research projects.

The goal of the presentation is to introduce good practices and useful tools
that will ensure that the work you do during your project is
- understandable by you if you go back to it a few months after it was done;
- understandable by other people than you (your supervisor, your collaborators,
  other members of the lab/team after you are gone, referees for a paper based
  on your work, ...);
- reproducible by someone other than you (for example with different parameters),
- ...

Basically, you want that all the efforts you have put into your work
result in something that will last beyond the very limited time
of your internship, that you or someone else can take it later and
understand it, improve it, criticize it, ...


## Resources

Achieving the goals outlines above is far from easy, and there is no way that
we can cover what it takes in the timefrane of a short presentation.

The journal <a href="https://journals.plos.org/ploscompbiol/">PLOS Computational Biology</a>
has a collection of easy to read (but not easy to apply) papers called
<a href="https://collections.plos.org/collection/ten-simple-rules/">Ten Simple Rules</a>
that contains many papers on this topic, each describing 10 simple rules
relevant to achieve some specific goals.

We recommand the following papers from this collection:  
- 
<a href="https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424">
A Quick Guide to Organizing Computational Biology Projects
</a>  
- 
<a href="https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003285">
Ten Simple Rules for Reproducible Computational Research
</a>  
- 
<a href="https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005097">
Ten Simple Rules for Digital Data Storage
</a>  
- 
<a href="https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004385">
Ten Simple Rules for a Computational Biologist’s Laboratory Notebook
</a>  
- 
<a href="https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004668">
A Quick Introduction to Version Control with Git and GitHub
</a>  
- 
<a href="https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004947">
Ten Simple Rules for Taking Advantage of Git and GitHub
</a>  



It is based on the github repo of a research project in progress (with
PhD student Aniket Mane) on the comparison of bioinformatics tools for
the problem of plasmids binning, applied to a data set of genomes from
the pathogens *E. faecalis* and *E. faecium*.

**The precise details of this work are not important, as the goal of
this repo is to illustrate github and Jupyter in such a project.**

## Context

The research project aims at evaluating the accuracy of various
bioinformatics tools that analyse genomics data (genome assembly
graph) of pathogens isolates to detect plasmids.

The elements of this project that are relevant for this presentation
are the following:
- The **data** was composed of a set of **samples**, where for each we were provided with
  - a unique **identifier**, the ID of the sample sequencing data on the
  <a href="https://www.ncbi.nlm.nih.gov/sra">NCBI SRA</a> data repository,
  - an **assembly graph** file recording the assembly of the sequence data into **contigs**,
  - a labelling of each contig in the assembly graph as **chromosome**, **plasmid**, **ambiguous**
  (the **ground truth** for the analysed samples).
- For each considered plasmid binning tool (*HyAsP*, *MOB-recon*, *PlasBin*, *plasmidSPAdes*)
  - the tool was applied to analyse all samples,
  - for each sample, an accuracy statistics (**F1**) was computed.
- The computations were conducted on a High-Performances Computing cluster,
  the cluster *cedar* of the <a href="https://alliancecan.ca">Digital research Alliance of Canada</a>.

The goal of this presentation is to illustrate the following important aspects of such a project:
- **Organize well your data, computations and results**:
  Follow good practices to
  - organize your data before you process them,
  - process your data with various methods,
  - organize the results of your computations.

- **Know your data before you analyze it**:
  never process data before you have spend time understanding it.

- **Document your work** using Jupyter notebooks.

