#!/usr/bin/env python

"""
journal_utils.py: functions for journal notebook
"""

''' Read a file with one entry per line into a list '''
def samples_file2list(in_file):
    samples_list = []
    with open(in_file, 'r') as fp:
        for sample in fp.readlines():
            samples_list.append(sample.rstrip())
    return samples_list
    
''' Compute the elements of list1 that are not in list 2 '''
def diff_lists(list1, list2):
    return [x for x in list1 if x not in list2]