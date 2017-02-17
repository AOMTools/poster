from __future__ import division
import numpy as np
from lmfit import Model
import matplotlib.pyplot as plt

T_atom = np.genfromtxt("T_atom")
T_woatom = np.genfromtxt("T_woatom")

# Define the fitting function
def lorentzian(x, amp, width, mean):
    top = amp * (width**2 / 4)
    bottom = (x - mean)**2 + (width/2)**2
    y = top/bottom
    return y

def normal_mode(x, amp, width, mean, const1, const2, shift):
    lor_a = width**2 / (width**2 + 4*(x - mean)**2)
    lor_d = - 2 * width * (x - mean) / (width**2 + 4*(x - mean)**2)
    bottom = (1 + const1* lor_a)**2 + (const2*(x - mean - shift) + const1* lor_d)**2
    return amp/bottom

def lorentz_fitting(data, init, no_trials = 1):
    # Declare model and initializing data
    lzmod = Model(lorentzian)
    xdata = data[:,0]
    ydata = data[:,1]
    ystderr = data[:,2] / np.sqrt(no_trials)

    # Set parameter hints
    lzmod.set_param_hint('amp', value = init[0], min=0)
    lzmod.set_param_hint('width', value = init[1], min=0)
    lzmod.set_param_hint('mean', value = init[2])
    pars = lzmod.make_params()

    fit = lzmod.fit(ydata, pars, x=xdata, weights=1/ystderr, verbose=False)
    print fit.fit_report()

    amp_est = fit.params['amp'].value
    amp_std = fit.params['amp'].stderr
    width_est = fit.params['width'].value
    width_std = fit.params['width'].stderr
    mean_est = fit.params['mean'].value
    mean_std = fit.params['mean'].stderr
    redchi = fit.redchi

    # Return back the result list with the following order:
    result_list = [amp_est, amp_std, width_est, width_std, mean_est, mean_std, redchi]

    return result_list

def normal_mode_fitting(data, init, no_trials = 1):
    # Declare model and initializing data
    lzmod = Model(normal_mode)
    xdata = data[:,0]
    ydata = data[:,1]
    ystderr = data[:,2] / np.sqrt(no_trials)

    # Set parameter hints
    lzmod.set_param_hint('amp', value = init[0], min=0)
    lzmod.set_param_hint('width', value = init[1], min=0, max=80)
    lzmod.set_param_hint('mean', value = init[2])
    lzmod.set_param_hint('const1', value = init[3], min=0)
    lzmod.set_param_hint('const2', value = init[4], min=0)
    lzmod.set_param_hint('shift', value = init[5])

    pars = lzmod.make_params()

    fit = lzmod.fit(ydata, pars, x=xdata, weights=1/ystderr, verbose=False)
    print fit.fit_report()

    amp_est = fit.params['amp'].value
    amp_std = fit.params['amp'].stderr
    width_est = fit.params['width'].value
    width_std = fit.params['width'].stderr
    mean_est = fit.params['mean'].value
    mean_std = fit.params['mean'].stderr
    const1_est = fit.params['const1'].value
    const1_std = fit.params['const1'].stderr
    const2_est = fit.params['const2'].value
    const2_std = fit.params['const2'].stderr
    shift_est = fit.params['shift'].value
    shift_std = fit.params['shift'].stderr

    redchi = fit.redchi

    # Return back the result list with the following order:
    result_list = [amp_est, amp_std, width_est, width_std, mean_est, mean_std, redchi, const1_est, const1_std, const2_est, const2_std, shift_est, shift_std]

    return result_list    

T_woatom_init = np.array([30, 80, 40])
res_woatom = lorentz_fitting(T_woatom, T_woatom_init)
T_atom_init = np.array([32.7, 6, 34, 0.15, 0.025, -5])
res_atom = normal_mode_fitting(T_atom[1:], T_atom_init)

data_x = np.linspace(-55, 125, 1000)

plt.plot(T_woatom[:,0], T_woatom[:,1], marker='o')
plt.plot(data_x[:], lorentzian(data_x[:], res_woatom[0], res_woatom[2], res_woatom[4]))

plt.plot(T_atom[:,0], T_atom[:,1], marker='o')
plt.plot(data_x[:], normal_mode(data_x[:], res_atom[0],res_atom[2], res_atom[4], res_atom[7], res_atom[9], res_atom[11]))
plt.show()

# np.savetxt("fit_T_woatom", np.stack((data_x[:], lorentzian(data_x[:], res_woatom[0], res_woatom[2], res_woatom[4])), axis=1))
# np.savetxt("fit_T_atom", np.stack((data_x[:], normal_mode(data_x[:], res_atom[0],res_atom[2], res_atom[4], res_atom[7], res_atom[9], res_atom[11])), axis=1))