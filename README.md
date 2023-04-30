# CompMath Day 2023

## Overview

This repo serves as support for the presentation by Cedric Chauve and
Mahsa Faizrahnemoon on the use of github and jupyter notebooks for
data-science research projects.

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
  (the **ground truth** for the analysed samples)
- For each considered plasmid binning tool (*HyAsP*, *MOB-recon*, *PlasBin*, *plasmidSPAdes*)
  - the tool was applied to analyse all samples,
  - for each sample, an accuracy statistics (**F1**) was computed.
- The computations were conducted on a High-Performances Computing cluster
  (the cluster *cedar* of the <a href="https://alliancecan.ca">Digital research Alliance of Canada</a>.

The goal of this presentation is to illustrate the following important aspects of such a project:
- **Organize well your data, computations and results**:
  Follow good practices to
  - organize your data before you process them,
  - process your data with various methods,
  - organize the results of your computations.

- **Know your data before you analyze it**:
  never process data before you have spend time understanding it.

- **Document your work** using Jupyter notebooks.

