using Convex, SCS


function cvx_opt(m::Int64, n::Int64)
# Generate random problem data
#m = 4;  n = 5
A = randn(m, n); b = randn(m, 1)

# Create a (column vector) variable of size n x 1.
x = Variable(n)

# The problem is to minimize ||Ax - b||^2 subject to x >= 0
# This can be done by: minimize(objective, constraints)
problem = minimize(sumsquares(A * x - b), [x >= 0])

# Solve the problem by calling solve!
solve!(problem, SCSSolver())

# Check the status of the problem
return problem.optval

end

cvx_opt(100,80)
