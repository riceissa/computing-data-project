#!/usr/bin/env python3
# License: CC0

from mpl_toolkits.mplot3d import Axes3D
import mysql.connector
import matplotlib.pyplot as plt
from matplotlib import cm
import numpy as np
import pdb

cnx = mysql.connector.connect(user='issa', database='computingdata')
cursor = cnx.cursor()

cursor.execute("""select ram, cpu, cost
                  from cloud_instance_specs
                  left join cloud_instance_costs on
                      cloud_instance_specs.name = cloud_instance_costs.name
                  where cloud_instance_specs.name regexp 'node'""")

data = cursor.fetchall()
rams = []
cpus = []
prices = []
for ram, cpu, price in data:
    rams.append(ram)
    cpus.append(cpu)
    prices.append(price)

prediction_constants = np.linalg.lstsq(np.matrix([rams, cpus]).T, np.matrix(prices).T)[0]

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.scatter(rams, cpus, prices)
ax.set_xlabel("ram")
ax.set_ylabel("cpu")
ax.set_zlabel("price")

X, Y = np.meshgrid(rams, cpus)
# do this manually for now, because i don't know how to extract values from
# prediction_constants
Z = np.add(np.multiply(X, 0.00423352), np.multiply(Y, 0.00930039))
surf = ax.plot_surface(X, Y, Z, cmap=cm.summer)

plt.show()
