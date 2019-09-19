import numpy as np
import matplotlib.pyplot as plt

filename = 'step1_00200.dat' # {0:05d} used for formatting --> can input 5 digit integer



f = open(filename, 'r')

data = f.readlines() #importing the data file

x = 100*[0]
u = 100*[0]

for i in range(1,len(data)):
    x[i-1] ,u[i-1] = map(float, data[i].split())

plt.plot(x,u)
plt.show()
