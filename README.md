# ARETE_PLASMIDS_PAPER

## Overview

This repo contains the material and experiments for the plasmids paper of the ARETE grant.

The purpose of the paper is to analyze a large dataset of *E. faecium* samples for which hybrid short-reads and long-reads assemblies will be proevided.  

The short-reads data were generated in 2017 using Illumina while the long-reads data were generated in 2021 usaing Oxford Nanopore.

The hybrid data and short-reads data were assembled using Unicycler. The hybrid data, that will be used as a proxy for ground truth, were polished using Pilon.

The initial purpose of the work is to assess and compare the performances of several plasmids prediction methods. Potential foillow-up steps will include the analysis of the predicted plasmids.

## Data

**TO DO [ANIKET]**: provide an overview of the data and metadata.

## Data preparation

#### Hybrid assemblies

The hybrid assemblies will be analyzed to extract chromosomal and plasmid contigs. To do so, features of each contig will be recorded in the spreadsheet
<a href="https://docs.google.com/spreadsheets/d/1TYZfiw3Tucnz9zZE81R3uaRorE0WGbjU6eGbrT2gTYI">hybrid contigs properties</a>. One issue is that the information about contigs circularity might be removed from the FASTA header by Pilon and we will need to check if Pilon modifies the length of the contigs after polishing; if not, then the feature can be extracted from the pre-polishing contigs from the FASTA header generated by Unicycler.

**TO DO**: assign the task to fill in each column to people. **[Aniket]**: contig length and circularity.

From the contigs features, we will determine which ones are plasmid, which ones are chromosomal and which ones are ambiguous or unlaballed.

### Short-reads assemblies

For each short-reads assembly, we will consider two versions of the assembly graph: a full graph and a reduced graph where contigs whose length is not greater than a given length threshold (default 100bp) are removed and every pair of their neighbours is connected through an edge.

**TO DO [ANIKET]**:  Complete the script [scripts/reduce_assembly_graph.py](scripts/reduce_assembly_graph.py) that does this reduction. Write a notebook describing the ipact of this step on the input graphs.

## Experiments

The short-read assembly graphs will be processed, using both the initial graph and the reduced graph, with the following tools, three classification tools:
- <a href="https://github.com/cchauve/plASgraph">plASgraph</a> **[CEDRIC]**,
- <a href="https://github.com/Shamir-Lab/PlasClass">PlasClass</a> used with its default model **[CEDRIC]**,
- <a href="">PlasForest</a>,  

and four or five binning tools:  
- <a href="https://github.com/cchauve/HyAsP">HyAsP</a> **[CEDRIC]**,
- <a href="https://github.com/phac-nml/mob-suite">MOB-suite</a> **[HALEY]**,
- <a href="https://github.com/cchauve/PlasBin">PlasBin</a> **[ANIKET]** --PlasBin should be modified to run in two versions, one that uses gene density and one that uses the plASgraph plasmid score instead --,
- <a href="https://cab.spbu.ru/software/plasmid-spades/">plasmidSPAdes</a> **[ANIKET]**.
- <a href="https://github.com/Shamir-Lab/SCAPP">SCAPP</a> **[ANIKET]** (using different configurations with plasmid scores).

Moreover, the plasmids predicted by each method should be typed using MOB-typer **[ANIKET]**.

The results will be evaluated using <a href="https://github.com/acme92/PlasEval">PlasEval</a>.

**TO DO [ANIKET]**: PlasEval should be updated to be a repo on its own, with proper documentation and high-quality code.  The precision/recall/F1 statistics should come in two versions, one in terms of the number of contigs (with a default parameter to specify short contigs to discard?) and one in terms of number of base pairs.

## Remarks

The script to reduce the assembly graph should have a companion script to put back the removed contigs into the plasmid bins and the corresponding FASTA files.  

In order to ease analysis, we should decide of a format for plasmid bins and contig scores that would be used for input files of the analysis, and so each method should come with a script that reformats its output.
