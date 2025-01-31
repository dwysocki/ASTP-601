---
title: "From Spin Noise to Systematics: Stochastic Processes in the First International Pulsar Timing Array Data Release"
author: Daniel Wysocki
date: 2016-02-23T16:00:00-05:00
category: journal_club
---

# Paper

"From Spin Noise to Systematics: Stochastic Processes in the First International Pulsar Timing Array Data Release" by L. Lentati et. al.

<http://arxiv.org/abs/1602.05570v1>


# Summary

The International Pulsar Timing Array (IPTA) is a group of organizations, observing an array of pulsars, using a number of radio telescopes across the world. The goal is to detect the passage of gravitational waves through variations in the timing signature. IPTA has recently made their first public data release. This paper seeks to better understand the various noise sources present in the data. By improving our understanding of the noise, we can hope to gain more confidence in future GW detections, avoid false positives, and alter our observing strategies for increased precision. It can also avoid general misjudgements about astrophysical parameters inferred from the data.


# Signal Models

On Page 2, Figure 1 motivates the need for various noise models. It shows a window of time for two different pulsars, with the timing residuals plotted on the y-axis (i.e. the difference from the deterministic pulse model). These were selected as they have temporally overlapping observations from multiple observatories, and have a number of statistically significant outliers.

A number of signal models were considered, including one deterministic (the pulses) and 5 stochastic (Page 4 equation 1 & bullets after). Only one of the 5 components (white noise) was taken for granted. The others were selected by weighing their evidence against their complexity. Page 9, half-way through paragraph 2 describes the model selection criteria. Page 10, Table 2, summarizes the results for each pulsar and model combination, with the best fit highlighted in boldface. Note that many had no significant noise contributions, and precisely one had all four.

Page 14, Figure 4, shows maximum-likelihood estimates for the noise attributed to just one of the observatories. This emphasizes the importance of multiple observatories observing with overlapping epochs.

Page 23, Figure 12, shows variations in the dispersion measure, which is attributed to the movement of the ISM along the line-of-sight to the pulsars.

Page 25, Figure 15, shows noise intrinsic to the spin of the pulsars.

Page 16, Figure 6, shows 95% confidence upper bounds on gravitational-wave background signals for a simulated data set based on parameters from one pulsar, and considering different stochastic models. They claim that this shows proper noise modeling can significantly improve accuracy.


# Definitions

Dispersion delay: Time delay between different frequencies.

$$\left(\frac{t}{\rm sec}\right) \approx 4.149 \times 10^3 \left(\frac{DM}{\rm pc\ cm^{-3}}\right) \left(\frac{\nu}{\rm MHz}\right)^{-2}$$

Dispersion measure: number of electrons along line of sight.

$$DM = \int_0^d n_e d{\ell}$$
