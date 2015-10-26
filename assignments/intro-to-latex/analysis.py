#!/usr/bin/env python3

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from statsmodels.regression.linear_model import OLS
from statsmodels.tools.tools import add_constant
import tabulate as tab


def display_table(table):
    tex_table = tab.tabulate(table, headers=header, tablefmt="latex")
    print(tex_table)


def angular_momentum(m, r, P):
    """
    Returns the angular momentum of a uniform, spherical object with mass *m*,
    radius *r*, and rotational period *P*.
    """
    return (4*np.pi/5) * (m*r**2) / P


def get_m_L_data(data):
    """
    Returns the mass (m) and angular momentum (L) data from the given DataFrame,
    calculating L if necessary.
    """
    m_L_data = data[["m", "L"]]

    for name in data.index:
        m, r, P, L = data.loc[name, :]

        # L was not already given, and can be calculated
        if np.isnan(L) and not any(np.isnan(x) for x in [m, r, P]):
            # calculate the angular momentum
            L = angular_momentum(m, r, P)
            # and store it in the DataFrame
            m_L_data.loc[name,"L"] = L

    return m_L_data


def model_m_L(data):
    log_m, log_L = np.log10(data).dropna().as_matrix().T
    X = add_constant(log_m)

    model = OLS(log_L, X)
    results = model.fit()

    print(results.summary())

    return results.params



def plot_m_L(data, intercept, slope, filename):
    # extract data
    m = data["m"]
    L = data["L"]
    # generate fitted data
    fitted_m = np.linspace(min(m), max(m), 300)
    fitted_L = 10**(intercept)+fitted_m**slope
    # initialize figure and axes
    fig, ax = plt.subplots()

    # format axes
    ax.set_xlabel(r"$m\ ({\rm kg})$")
    ax.set_ylabel(r"$L\ ({\rm kg m}^2{\rm /d})$")

    ax.set_xscale("log")
    ax.set_yscale("log")

    # plot the data
    ax.scatter(data["m"], data["L"], marker="x")
    # plot the fit
    ax.plot(fitted_m, fitted_L, "r--")

    # save the plot
    fig.savefig(filename)


data_fname = "data.dat"
plot_fname = "m-L_log-log.eps"

header = ["name", "m", "r", "P", "L"]

data = pd.read_table(data_fname,
                     names=header,
                     na_values="NA", comment="#",
                     skiprows=1, index_col=0,
                     sep=r"\s+")

m_L_data = get_m_L_data(data)

intercept, slope = model_m_L(m_L_data)
plot_m_L(m_L_data, intercept, slope, plot_fname)

print("Raw Data")
display_table(data)
print("#"*40)
print("Mass--Angular Momentum Data")
display_table(m_L_data)
