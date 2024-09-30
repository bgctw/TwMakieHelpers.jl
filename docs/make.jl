using TwMakieHelpers
using Documenter

DocMeta.setdocmeta!(TwMakieHelpers, :DocTestSetup, :(using TwMakieHelpers); recursive=true)

makedocs(;
    modules=[TwMakieHelpers],
    authors="Thomas Wutzler <twutz@bgc-jena.mpg.de> and contributors",
    sitename="TwMakieHelpers.jl",
    format=Documenter.HTML(;
        canonical="https://bgctw.github.io/TwMakieHelpers.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/bgctw/TwMakieHelpers.jl",
    devbranch="main",
)
