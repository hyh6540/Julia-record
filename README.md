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






### 矩阵

|表达式|等价函数|对应Matlab表达式|备注|
|-|-|-|-|
|`[A B ...]`|`hcat`|`[A B ...]`||
|`[A, B, C, ...]`|`vcat`|`[A; B; C; ...]`|Julia也是可以使用分号来表示的，<br>但是逗号是两者最大的区别。|
|`[A B; C D; ...]`|`hvcat`|`[A B; C D; ...]`||
|`A'`|`adjoint`|`A'`|两者都表示共轭转置矩阵, <br>如果仅仅是转置，则用`transpose(A)`.|
|`A[i]`|`getindex`|`A[i]`||
|`A[i] = x`|`setindex!`|`A[i] = x`||





## 参考内容
1. https://docs.julialang.org/en/v1/manual/getting-started/
2. https://www.w3cschool.cn/julia/13yv1jf2.html
