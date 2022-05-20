#!/usr/bin/env python

"""
reduce_assembly_graph.py: Reduce a GFA assembly graph to remove  nodes of length not greater than a given threshold and connects every pair of neighbour.

Usage reduce_assembly_graph --input/-i input_graph [--length/-l length_threshold] --output/-o output_graph [--log log_file]
--input/-i: input assembly graph in GFA format
--length/-l [optional]: integer (default value: 100)
--output/-o: path to output file, in GFA format (directories are created if not existing)
--log [optional]: log file containing statistics on the input and output graph (number of vertices and edges)
"""

__author__      = "Cedric Chauve, Aniket Mane"

# Built-in/Generic imports
import os
import sys
import argparse

# Libraries
import networkx

def read_graph(file_path):
    """ Read a GFA graph and returns a networkx graph object """
    print('to do')

def process_graph(graph, min_len):
    """ 
    Reduce a graph object to remove all nodes of length <= min_len and connect their neighbours.
    Return a network graph object.
    """
    print('to do')
    
def write_graph(graph, file_path):
    """ 
    Write a graph object in a GFA file.
    Creates the directories if they do not exist.
    """
    print('to do')

if __name__ == "__main__":
    print('to do')
