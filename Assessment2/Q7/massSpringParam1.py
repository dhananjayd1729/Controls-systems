import numpy as np
#import control as cnt
import sys
sys.path.append('..') #add parent directory

import massSpringParam as P

Ts = P.Ts #sample rate of the controller
beta = P.beta #dirty derivative gain
tau_max = P.tau_max #limit on control signal

#PD gains
kp = 4.87
kd = 13.35

print('kp: ', kp)
print('kd: ', kd)