#!/usr/bin/env python

"""
GFA_utils.py: Tools to manipulate assembly graphs in GFA 1 format (http://gfa-spec.github.io/GFA-spec/GFA1.html) used by Unicycler.

Available commands:

1. Reducing an assembly graph to remove nodes of length not greater than a given threshold and connects every pair of neighbour.

Usage: GFA_utils.py -r --input/-i input_graph [--length/-l length_threshold] --output/-o output_graph [--log log_file]
--input/-i: input assembly graph in GFA 1 format (http://gfa-spec.github.io/GFA-spec/GFA1.html)
--length/-l [optional]: integer (default value: 100)
--output_graph/-o: path to modified graph, file in GFA 1 format (directories are created if not existing)
--log [optional]: log file containing statistics on the input and output graph (number of vertices and edges)

Format of output file: the output file is in GFA 1 format.
In the resulting graph file, every possible path between two non-discarded contigs should be added using a new tag D, to be documented.
Remark: different paths can connect the same contig pairs, and the discarded contigs will not appear in the list of segments.

2. Expanding a set of predicted plasmid sequences in FASTA format by inserting back the discarded contigs.

Usage: GFA_utils.py -e --input_graph/-g input_reduced_graph --input_plasmids/-p input_predicted_plasids --output/-o output_predicted_plasmids [--log log_file]
--input_graph/-g: input reduced assembly graph in GFA 1 format
--input_plasmids/-p: input predicted plasmids sequences in the our in-house FASTA format
--output/-o: path to output file, in FASTA format (directories are created if not existing)
--log [optional]: log file containing statistics on the expansion (added sequences, possible ambiguities)

Format of the output file: our in-house FASTA format
Remark: we will need to decide how to handle is two consecutive contigs can be joined by different paths.
"""

__author__ = "Cedric Chauve, Aniket Mane"

# Built-in/Generic imports
import os
import sys
import argparse

# Libraries
import networkx

""" Assembly graphs """

def read_graph(file_path):
    """ Read a GFA graph and returns a networkx graph object """
    print('to do')

def write_graph(graph, file_path):
    """ 
    Write a graph object in a GFA file.
    Creates the directories if they do not exist.
    """
    print('to do')
    

""" Plasmids FASTA files input/output """

# To do: create an internal data structure for predicted plasmids
    
def read_plasmids(FASTA_file_path):
    """ Read the FASTA file for predicted plasmids """
    print('to do')

def write_plasmids(plasmids, FASTA_file_path):
    """ Write plasmids into a FASTA file """
    print('to do')

    
""" Processing data """
    
def reduce_graph(graph, min_len):
    """ 
    Reduce a graph object to remove all nodes of length <= min_len and connect their neighbours.
    Return a network graph object.
    """
    print('to do')

def expand_plasmids(plasmids, graph):
    """
    Expand predicted plasmids using the discarded paths information from a reduced graph
    """
    print('to do')
    
    


if __name__ == "__main__":
    print('to do')
