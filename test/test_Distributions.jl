using Test
using TwMakieHelpers
using Distributions
using CairoMakie

() -> begin
    #using WGLMakie
    WGLMakie.activate!()
end

@testset "plot_dist!" begin
    d = LogNormal()
    fig = density_dist(d; normalize=true, label="normalized")
    ax = only(contents(fig[1, 1]))
    #methods(density_dist!)
    lab = density_dist!(ax, d)
    @test lab == "pdf(Distributions.LogNormal{Float64}(μ=0.0, σ=1.0))"
    #@test lab == "pdf(LogNormal{Float64}(μ=0.0, σ=1.0))"
    ax.xlabel = lab
    axislegend(ax, unique=true)
    fig
    #
    # invoke with keyword arguments 
    fig = density_dist.((d,d); normalize = true)
end;

