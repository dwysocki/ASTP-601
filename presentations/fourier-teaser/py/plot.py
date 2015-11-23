#!/usr/bin/env python3

import sys
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import AutoMinorLocator


def main():
    if len(sys.argv) != 5:
        print("Usage: plot [phot file] [period] [star name] [output file]",
              file=sys.stderr)
        exit()

    filename, period, name, output = sys.argv[1:]
    period = float(period)

    data = np.loadtxt(filename)
    plot_lightcurve(name, data, period, output)


def plot_lightcurve(name, data, period, output):
    # initialize Figure and Axes objects
    fig, ax = plt.subplots(figsize=(6.97, 4.31))

    # format the x- and y-axis
    ax.invert_yaxis()
    if period > 0:
        ax.set_xlim(0,2)

    # Plot points used
    time, mag, error = data.T

    if period > 0:
        time  = (time/period) % 1.0
        time  = np.hstack((time,1+time))
        mag   = np.hstack((mag,mag))
        error = np.hstack((error,error))


    points = ax.errorbar(time, mag, yerr=error,
                         color="darkblue",
                         ls='None',
                         ms=.01, mew=.01, capsize=0)

    if period > 0:
        ax.set_xlabel('Phase ({0:0.7} day period)'.format(period))
    else:
        ax.set_xlabel('Time (days)')

    ax.set_ylabel('Magnitude')

    ax.xaxis.set_minor_locator(AutoMinorLocator(5))
    ax.yaxis.set_minor_locator(AutoMinorLocator(5))

    ax.set_title(name)
    fig.tight_layout(pad=0.1)

    fig.savefig(output)
    plt.close(fig)


if __name__ == "__main__":
    exit(main())
