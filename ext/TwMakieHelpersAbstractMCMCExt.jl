module TwMakieHelpersAbstractMCMCExt

# function __init__()
#     @info "TwMakieHelpers: loading TwMakieHelpersAbstractMCMCExt"
# end

import TwMakieHelpers as CP 
using TwMakieHelpers
using Makie
#using Distributions
using AbstractMCMC

const AChains = AbstractMCMC.AbstractChains

function CP.plot_chn(chns::AChains, args...; kwargs...)
    fig = Figure(; size = (1_000, 800))
    CP.plot_chn!(fig, chns, args...; kwargs...)
end

function CP.plot_chn!(fig::Figure, 
    chns::AChains; linkaxes=false, 
    param_label="Parameter estimate",
    params = names(chns, :parameters)
    )
    n_chains = size(chns, 3)
    n_samples = length(chns)
    for (i, param) in enumerate(params)
        ax = Axis(fig[i, 1]; ylabel = string(param))
        for chain in 1:n_chains
            values = chns[:, param, chain]
            lines!(ax, 1:n_samples, values; label = string(chain))
        end

        hideydecorations!(ax; label = false)
        if i < length(params)
            hidexdecorations!(ax; grid = false)
        else
            ax.xlabel = "Iteration"
        end
    end
    for (i, param) in enumerate(params)
        ax = Axis(fig[i, 2]; ylabel = string(param))
        for chain in 1:n_chains
            values = chns[:, param, chain]
            density!(ax, values; label = string(chain))
        end

        hideydecorations!(ax)
        if linkaxes 
          if i < length(params)
              hidexdecorations!(ax; grid = false)
          else
              ax.xlabel = param_label
          end
        else
            if i < length(params)
                hidexdecorations!(ax; grid = false, ticks=false, ticklabels=false)
            else
                ax.xlabel = string(param)
            end
        end
    end
    axes = [only(contents(fig[i, 2])) for i in 1:length(params)]
    if linkaxes 
      linkxaxes!(axes...)
    end
    axislegend(first(axes))
    return(fig)
end


end

