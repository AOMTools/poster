import numpy as np
import sys
import os
from os import listdir
from os.path import isfile, join
import matplotlib.pyplot as plt

from math import *
from lmfit import Model
def exp_decay(x, yoff, amp, dec,ps):
    y = yoff + amp * np.exp( -(x-ps) / dec)
    return y

def decay_fitting(xdata,ydata,ystderr, init, no_trials = 1):
    # Declare model and initializing data
    print('Fitting now...')
    lzmod = Model(exp_decay)
    print(fitguess)
    # Set parameter hints
    lzmod.set_param_hint('amp', value = init[0])
    lzmod.set_param_hint('dec', value = init[1] )
    lzmod.set_param_hint('yoff', value = init[2])
    lzmod.set_param_hint('ps', value = init[3])
    pars = lzmod.make_params()

    fit = lzmod.fit(ydata, pars, x=xdata, weights=1/ystderr, verbose=False)
    #print fit.fit_report()

    amp_est = fit.params['amp'].value
    amp_std = fit.params['amp'].stderr
    decay_est = fit.params['dec'].value
    decay_std = fit.params['dec'].stderr
    yoff_est = fit.params['yoff'].value
    yoff_std = fit.params['yoff'].stderr
    redchi = fit.redchi

    # Return back the result list with the following order:
    result_list = [amp_est, amp_std, decay_est, decay_std,yoff_est,yoff_std, redchi]

    return (result_list,fit)
raw_T_array = np.genfromtxt("extinction_norm_data.dat")

t=raw_T_array[:,0]
print(t)
T_avg=raw_T_array[:,1]
T_std=raw_T_array[:,2]
sT=np.size(t)

fitguess=[0.6,60,13,0.5]
(resultfit,fit)=decay_fitting(t,T_avg,T_std/np.sqrt(sT),fitguess)
print(fit.best_fit)
rs=np.column_stack((t,fit.best_fit))
np.savetxt('fittrans.dat',rs)
#plt.plot(t,T_avg)
#plt.plot(t,fit.best_fit)
#plt.show()
