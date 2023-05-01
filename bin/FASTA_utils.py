#!/usr/bin/env python

"""
FASTA_utils.py: Tools to manipulate FASTA files 
"""

__author__ = "Cedric Chauve"

import sys
import os
import argparse
from Bio import SeqIO
import csv

def FASTA2len_CSV(in_FASTA_file, out_CSV_file):
    '''
    Computes a CSV file recording the length of all sequences in a FASTA file
    '''
    len_dict = [
        {'Seq ID': seq_record.id, 'Seq len': len(seq_record.seq)}
        for seq_record in SeqIO.parse(in_FASTA_file, 'fasta')
    ]
    csv_cols = ['Seq ID', 'Seq len']
    try:
        with open(out_CSV_file, 'w') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=csv_cols)
            writer.writeheader()
            for data in len_dict:
                writer.writerow(data)
    except IOError:
        print("I/O error")


def main():
    parser = argparse.ArgumentParser(description='Manipulating FASTA files.')
    subparsers = parser.add_subparsers(help='sub-command help')
    # csv_len command arguments
    csv_len_parser = subparsers.add_parser('csv_len')
    csv_len_parser.set_defaults(cmd='csv_len')
    csv_len_parser.add_argument('input', type=str, help='Input FASTA file')
    csv_len_parser.add_argument('output', type=str, help='Output CSV file')
    
    args = parser.parse_args()
    
    if args.cmd == 'csv_len':
        FASTA2len_CSV(args.input, args.output)
    # Other commands ...

if __name__ == "__main__":
    main()
