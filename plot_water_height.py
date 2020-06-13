"""
Plots the water elevation profile at one time step.
"""
import argparse
parser = argparse.ArgumentParser()
parser.add_argument('input_file', type=str, help='text file output by tsunami simulator')
parser.add_argument('skip', type=int, help='plot every <skip> time steps')
args = parser.parse_args()

input_file = args.input_file
skip = args.skip

import numpy as np
import matplotlib.pyplot as plt
import matplotlib

matplotlib.use('Agg')
matplotlib.rcParams.update({'font.size': 16})

data = [line.rstrip().split() for line in open(input_file).readlines()]

time = [float(line[0]) for line in data]
h = np.array([[float(x) for x in line[1:]] for line in data])
x = np.arange(1, h.shape[1]+1)

fig = plt.figure(figsize=(8, 3))
plt.xticks(range(25, 125, 25))
plt.yticks(np.arange(-0.2, 1.4, 0.2))
x = np.arange(1, 101)
plt.xlabel('Distance [m]')
plt.ylabel('Water elevation [m]')

for n, t in enumerate(time):
    if not n % skip == 0: continue
    print('Plotting time step %i' % n)
    plt.cla()
    plt.plot(x, h[n], 'b-')
    plt.ylim(-0.2, 1.2)
    plt.xlim(1, 100)
    plt.title(r'Water elevation [m], time step ' + str(n))
    plt.savefig('water_height_' + '%4.4i' % n + '.png')