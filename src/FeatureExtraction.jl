export spikeshapeparamn,spikeshape,resample,PCAFeature

spikeshapeparamn = 13
function spikeshape(x::Real,p...)
    p[1]*exp(-((x-p[2])^2)/p[3]) + p[4]*exp(-((x-p[5])^2)/p[6]) + p[7]*exp(-((x-p[8])^2)/p[9]) + p[10]*exp(-((x-p[11])^2)/p[12]) + p[13]
end
function spikeshape(xs,p...;snr=5)
    s = spikeshape.(xs,p...)
    srms = sqrt(mean(s.^2))
    σ = srms/snr
    noise = rand(Normal(0,σ),length(s))
    s.+noise
end

function resample(sample::Vector,n=256)
    s = interpolate(sample, BSpline(Cubic(Natural(OnGrid()))))
    x = range(1,stop=length(sample),length=n)
    return x,s(x)
end
function resample(samples::Matrix,n=256)
    s = interpolate(samples, (BSpline(Cubic(Natural(OnGrid()))),NoInterp()))
    x = range(1,stop=size(samples,1),length=n)
    return x,hcat((s(x,j) for j in 1:size(samples,2))...)
end

mutable struct PCAFeature <: FeatureExtraction
    n
end

function (pca::PCAFeature)(spike)
    body
end
