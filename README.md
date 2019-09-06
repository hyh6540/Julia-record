# Julia-record
Julia的学习记录

## 基本内容

由于Julia的语法规则和Matlab十分相近，这里主要列出一些Julia和Matlab的不同之处。

### 函数

Julia的函数定义样例如下:
``` julia
function f(x,y)
  return x * y
  x + y
end
```

- 在Julia中，函数的定义是通过关键字`function`和`end`实现的，并且类似于Python，可以直接写带脚本中。这点和Matlab不一样，Matlab需要单独建立函数文件。
- 在Julia中，返回值对象的声明不同于Matlab。在有return的情况下, 范围值直接由return后的结果决定，在没有return的情况下，返回值则由最后一行的结果决定。在样例中，返回值为`x*y`的结果。
- 对于较为简单的函数，Julia可以直接通过类似"赋值"的形式来定义函数: `f(x,y)=x+y`. 与此对应的，Matlab可以通过函数句柄@: `f=@(x,y)(x+y);`.
- 在Julia中，多返回值，则可以通过元组来实现: `return x+y, x*y`.
- 在Julia中，有关键字参数，主要是一些可以控制的参数，但是有默认值，不是每次调用都需要修改，通过分号和其他的参数分开：`function plot(x,y; width=1)`.



### 类型

这个是Matlab中基本不太用的东西。在Julia中，则有很大的用处: 提高性能和稳定性，减少错误。

- Julia会区分2和2.0的不同，前者默认为整数类型，后者为浮点数类型，当遇到有输入要求的函数时，有可能会抛出异常。

- 相同的函数名称，但是使用不同的输入类型(或者不同的数目)，两者为不同的函数。使用时，会取决于当前输入值的类型，如果不匹配，则会抛出异常；如果两者都适用，则会提醒异常，同时随机选择一个使用。如：

  ```julia
  function f(x::Float64, y::Float64)
      return x+y
  end

  function f(x::Int64, y::Int64)
      return x-y
  end
  ```






### 矩阵

|表达式|等价函数|对应Matlab表达式|备注|
|-|-|-|-|
|`[A B ...]`|`hcat`|`[A B ...]`||
|`[A, B, C, ...]`|`vcat`|`[A; B; C; ...]`|Julia也是可以使用分号来表示的，<br>但是逗号是两者最大的区别。|
|`[A B; C D; ...]`|`hvcat`|`[A B; C D; ...]`||
|`A'`|`adjoint`|`A'`|两者都表示共轭转置矩阵, <br>如果仅仅是转置，则用`transpose(A)`.|
|`A[i]`|`getindex`|`A[i]`||
|`A[i] = x`|`setindex!`|`A[i] = x`||



### 并行计算

个人主要使用到的为基于多核的多进程并行。主要使用`remote_call`和`fetch`函数实现，如下：

```julia
require("count_heads")

a = @spawn count_heads(100000000)
b = @spawn count_heads(100000000)
fetch(a)+fetch(b)
```

亦可：

```julia
nheads = @parallel (+) for i=1:200000000
    int(randbool())
end
```



### 画图
在julia中, 画图有多种方法: http://docs.juliaplots.org/latest/backends/
1. 调用python中的画图matplotlib.pyplot. 需要提前安装`pycall`, 然后使用`pyplot`. 主要的用法和python中几乎一致.
```julia
using PyCall
using PyPlot
pygui(true)
x = collect(0:2*pi/1000:2*pi)
y = sin.(3*x + 4*cos.(2*x))
PyPlot.plot(x, y, color="red", linewidth=2.0, linestyle="--")
title(L"Plot of $\Gamma_3(x)$") # latex
xlabel("x",fontsize=14,color="red")
ylabel("sin(3x + 4cos(2x))")
```
具体内容可以参考: https://github.com/JuliaPy/PyPlot.jl
2. 使用`Plots`

3. 使用`GR`


## Atom的配置
遇到的问题:
1. Atom 1.39以上版本会出现一定的不兼容, 推荐暂时使用1.38版本.
2.

## 参考内容
1. https://docs.julialang.org/en/v1/manual/getting-started/
2. https://www.w3cschool.cn/julia/13yv1jf2.html
