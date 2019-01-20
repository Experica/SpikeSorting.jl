__precompile__(false)
module SpikeSorting

using StatsBase,Interpolations, Distributions,Flux,FileIO,Dates,Plots,DataStructures,Statistics

export SpikeDetection,FeatureExtraction,Clustering,unitscolor

abstract type SpikeDetection end
abstract type FeatureExtraction end
abstract type Clustering end

unitscolor=[:black,:red,:yellow,:lime,:deepskyblue,:magenta,:darkblue,:orange,:darkgreen,:deeppink,:coral,:cyan,:brown,:plum,:orangered,:darkgoldenrod]

include("FeatureExtraction.jl")
include("Clustering.jl")
include("NeuralNetwork.jl")

end # module
