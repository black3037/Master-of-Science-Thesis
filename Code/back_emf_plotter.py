'''
Derek Black 2017 (c)
Kansas State University

This file plots data collected for peak-peak voltages of a brushless DC motor.
This plot is used to estimate the back-emf constant (Ke).

'''

# Imports
import matplotlib.pyplot as plt
import math
import numpy as np
from numpy.linalg import inv

# Collected Data
Speed_RPM = [0.0, 300.0, 500.0, 1000.0, 1500.0, 2000.0]     # RPM
Voltage = [0.0, 4.64, 7.60, 15.1, 22.0, 30.0]               # Volts (Peak-Peak)

# Convert Speed to Appropriate Units
Speed_RAD = [(2.0*math.pi/60.0)*x for x in Speed_RPM]       # RPM -> Rad/s
Voltage = [(x/2.0) for x in Voltage]

# Data to Numpy Matricies
Speed = np.matrix(Speed_RAD)
Voltage = np.matrix(Voltage)

# Find Line of Best Fit - Least-Squares Normal Equation
b = inv(Speed*np.transpose(Speed))*Speed*np.transpose(Voltage)
flattened  = [val for sublist in b.tolist() for val in sublist]
b = flattened[0]
print b
print Speed_RAD

# Create plottable data to show best fit
y = [b*x for x in Speed_RAD]

# Plot Data
plt.figure(1)
plt.scatter(Speed,Voltage,color='black',marker='x',linewidth='2',label='Measured Back EMF')
plt.plot(Speed_RAD,y,'--',color='black', label='Line of Best Fit')
plt.grid(True)
plt.xlabel('Motor Speed (rad/s)')
plt.ylabel('Measured Voltage (V)')
plt.legend(loc='lower right')
plt.title('Back EMF Constant')
plt.show()
