#!/usr/bin/python3
# -*- coding: utf-8 -*-
""" Generate the ABC data table in different formats:

* CSV
* Fixed-with

(Excel is done manually)

Pierre Haessig — Sept 2018
"""

import numpy as np
import pandas as pd

np.random.seed(0)
a = np.random.rand(30, 3)

b = pd.DataFrame(a,columns=['a', 'b', 'c'])
print(b)

b.to_csv('abc1.csv', index=False)
b.to_csv('abc4.csv', index=False, sep=';', decimal=',')

with open('abc2.txt', 'w') as out:
    for i in range(len(a)):
        s = ['{:6.0f}'.format(a[i,k]*10**6) for k in range(3)]
        out.write(' '.join(s) + '\n')
