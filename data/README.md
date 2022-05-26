# Plasmids comparison paper: data

2022-05-25: Downloading assemblies and extracting GFAs.

One assembly looks weird: SRR14026525.  

- Directory `assembly_graphs`: all assembly graphs, in <a href="https://github.com/GFA-spec/GFA-spec/blob/master/GFA1.md">GFA 1</a> format, for both *E. faecium* and *E. faecalis*. Gzipped.  
- Directory `assembly_contigs`: all assembly in contigs, for both *E. faecium* and *E. faecalis*. Gzipped.
- Directory `metadata` contains <a href="http://quast.sourceforge.net/">QUAST</a> results for the assemblies.

For a given sample `SAMPLE`, the assembly graph is in the file `assembly_graphs/SAMPLE.assembly.gfa.gz` and the contigs assembly in the file `assembly_contigs/SAMPLE.scaffolds.fa.gz`.

Samples ID list, combined:
```
ls assembly_graphs/ | sed 's/\.assembly\.gfa\.gz\*//g' > samples_id.txt
```
The list of *E. faecium* and *E. faecalis* sample IDs are in the files `samples_Efaecalis_id.txt` and `samples_Efaecium_id.txt` obtained by
```
grep SRR metadata/Efaecalis_polished_genomes_quast_IlluminaAssemblySize.csv | cut -d , -f 3 | sed 's/_assembly_complete//g' > samples_E_faecalis_id.txt
grep SRR metadata/Efaecium_polished_genomes_quast_IlluminaAssemblySize.csv | cut -d , -f 3 | sed 's/_assembly_complete//g' > samples_E_faecium_id.txt
```