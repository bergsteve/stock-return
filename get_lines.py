#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Mar  4 15:40:42 2020

@author: alex
"""

in_file = 'datashare.csv'
out_file = 'GuKellyXiu_data_past20000101.csv'

f = open(out_file, "w")
with open(in_file) as fp:
   line = fp.readline()     # header
   f.write(line)
   line = fp.readline()
   while line:
       month_in_line = int(line.split(',')[1])
       if month_in_line >= 20000101 and month_in_line < 20050101:
           f.write(line)
           line = fp.readline()
       else:
           line = fp.readline()

f.close()
fp.close()