"""
    plot_chn(fchns::AbstractMCMC.AbstractChains; ... )
    plot_chn!(fig::Figure, chns::AbstractMCMC.AbstractChains; ... )

Plot MCMCChain lines and density. The first variant produces a figure,
the second variant plots into a matrix-grid of axes into given figure.

## Keyword arguments
- `linkaxes=false`: link x-axis across density plots of several chains
- `param_label="Parameter estimate"`: x-axis label below lowest density plot
- `params = names(chns, :parameters)`: subset of parameters to plot
"""
function plot_chn end
function plot_chn! end