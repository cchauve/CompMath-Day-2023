#!/usr/bin/env python

"""
Filter questionable plasmids from results in HyAsP format.

Usage: hyasp_filter_questionable_plasmids --input_dir/-i input_directory 
--input_dir/-i input_directory containing the HyAsP results assumed to be
  a contig_chains.csv containing all plasmid chains
  a questionable_plasmid_contigs.fasta containing the sequence of questionable plasmids

Creates in input_directory a file contig_chains_putative.csv containing the putative plasmids chains.
"""

__author__ = "Cedric Chauve, Aniket Mane"

# Built-in/Generic imports
import sys
import os

# Read questionable plasmids ID and returns the list of IDs of questionable plasmids
def read_questionable_plasmids(file_path):
    QUESTIONABLE_PLASMIDS_LIST = []
    QUESTIONABLE_PLASMIDS_DATA = open(file_path, 'r').readlines()
    for contig in QUESTIONABLE_PLASMIDS_DATA:
        if contig[0] == '>':
            plasmid_id = '_'.join(contig.split('|')[1].split('_')[1:]).rstrip()
            if plasmid_id not in QUESTIONABLE_PLASMIDS_LIST:
                QUESTIONABLE_PLASMIDS_LIST.append(plasmid_id)
    return(QUESTIONABLE_PLASMIDS_LIST)

# Filter out questionable plasmids and write them out in the putative plasmid chains file
def filter_questionable_plasmids(q_plasmids_list, in_chains_file_path, out_chains_file_path):
    PUTATIVE_CHAINS_DATA = open(out_chains_file_path, 'w')
    ALL_CHAINS_DATA = open(in_chains_file_path, 'r').readlines()
    for chain in ALL_CHAINS_DATA:
        plasmid_id = chain.split(';')[0]
        if plasmid_id not in q_plasmids_list:
            PUTATIVE_CHAINS_DATA.write(chain)

if __name__ == "__main__":
    DATA_DIR = sys.argv[1]
    ALL_CHAINS_FILE = os.path.join(DATA_DIR, 'contig_chains.csv')
    PUTATIVE_CHAINS_FILE = os.path.join(DATA_DIR, 'contig_chains_putative.csv')
    QUESTIONABLE_PLASMIDS_FILE = os.path.join(DATA_DIR, 'questionable_plasmid_contigs.fasta')
    QUESTIONABLE_PLASMIDS_LIST = read_questionable_plasmids(QUESTIONABLE_PLASMIDS_FILE)
    filter_questionable_plasmids(QUESTIONABLE_PLASMIDS_LIST, ALL_CHAINS_FILE, PUTATIVE_CHAINS_FILE)

