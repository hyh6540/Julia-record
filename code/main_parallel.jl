
using Distributed
using SharedArrays
Distributed.addprocs(4)

print(Distributed.workers())
@everywhere function f()
    return randn()
end


const N = 64::Int64
const L = 1000000000::Int64

# @everywhere f1() = f(N)
#a = SharedArray{Float64}(L,N)
A = 0.0
# A = zeros(L,N)
@time A = @distributed (+) for n=1:L
    f()
end
