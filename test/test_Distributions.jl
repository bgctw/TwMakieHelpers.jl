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
    fig = Figure(); #; size = (1_000, 800));
    ax = Axis(fig[1, 1])
    methods(density_dist!)
    lab = density_dist!(ax, d)
    @test lab == "pdf(Distributions.LogNormal{Float64}(μ=0.0, σ=1.0))"
    #@test lab == "pdf(LogNormal{Float64}(μ=0.0, σ=1.0))"
    ax.xlabel = lab
    fig
end;

