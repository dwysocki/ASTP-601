---
title: A Machine Learning Technique to Identify Transit Shaped Signals
author: Daniel Wysocki
date: 2015-09-02T16:00:00-05:00
category: journal_club
---

# Paper

"A Machine Learning Technique to Identify Transit Shaped Signals" by Thompson et al.

<http://arxiv.org/pdf/1509.00041.pdf>

# Summary

Supervised machine learning is used to automatically identify expolanets from Kepler light curves.


## Figures

Figure 1 shows some transit-like TCEs, folded on the left, and binned on the right. Figure 2 shows the same for non-transit-like TCEs.

Figure 4 shows a histogram of `log(T_LPP)` for (non-)transit-like TCEs.

Figure 5 shows a histogram of `log(T_LPP)` for injected transits, divided into pass/fail.

## Procedure

### Binning

(Summarized in Section 3.2, page 3, 3rd paragraph in the right column)

- Each star's light curve is folded on the Threshold Crossing Event (TCE) periods provided by the NExScI archive
- An equal number of bins near the TCE are chosen for each light curve
    - Bins are selected such that 51 lie within, and 90 outside the transit
        - (See Section 3.5 on page 5 for details)
- The mean of each bin is used as the magnitude
- Points are sorted by phase
- Points are normalized such that the minimum occurs at -1


### Dimensionality Reduction

(Summarized in Section 3.3, beginning of page 5)

- Locality preserving projections [(LPP)](http://papers.nips.cc/paper/2359-locality-preserving-projections.pdf) projects the binned light curves into a lower dimensional space
    - Algorithm is similar to PCA
        - Less sensitive to outliers
        - Better at preserving locality (hence the name) for methods like k-NN
    - produces a 20-dimensional feature vector for each event

### Classification

(Summarized in Section 3.5, pages 5 and 7)

- The k-nearest neighbor (k-NN) algorithm is used to label the events as transit-like or not
    - Training data are known transit-like events from kepler
        - (Section 3.4, page 5)
    - k = 15
    - Distance is measured by the Euclidean 2-norm
    - `T_LPP` is the mean of the `k` distances
        - If `T_LPP` for a given TCE is within the range of values for _known_ transit-like events, it is labeled as one

## Results

- Removes over 90% of non-transiting candidates from Kepler data, and retains over 99% of known transits
- Loses 1% of injected transits
    - (Injection described in Section 3.6, page 7)
