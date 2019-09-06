using PyCall
using PyPlot
pygui(true)
x = collect(0:2*pi/1000:2*pi)
y = sin.(3*x + 4*cos.(2*x))
z = sin.(3*x)
PyPlot.plot(x, y, color="red", linewidth=2.0, linestyle="--",label="y")
PyPlot.plot(x, z, color="blue", linewidth=2.0, linestyle="-",label="z")
PyPlot.title(L"Plot of $\Gamma_3(x)$") # latex
PyPlot.xlabel("x",fontsize=14,color="red")
PyPlot.ylabel("sin(3x + 4cos(2x))")
PyPlot.legend(loc = 0)
