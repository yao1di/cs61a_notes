# 与网络通信

``` python
from urllib.request import urlopen
shakespeare = urlopen("http://composingprograms.com/shakespeare.txt")
words = set(sha)
```

# 函数
## Environments

一个表达式被评估的环境由一系列框架组成。每个框架包含绑定，每个绑定将名称与其对应的值关联起来。有一个单一的全局框架。赋值和导入语句将条目添加到当前环境的第一个框架中。到目前为止，我们的环境只包括全局框架。

## Python，在代码行中运行时：
文件以` 'ex.py'`为例。
1. ` python ex.py`直接运行
2. ` python -i ex.py` 可以进入python的解释型命令行中
3. ` python -m doctest -v ex.py ` 可以测试。
在测试过程中，可以在注释中添加：
``` python
   """返回商和余数n/d.

    >>> q,r = divide_exact(2013,10)
    >>> q
    201
    >>> r
    3
    """
```

最终得到的输出如下：

``` python
    Trying:
        q,r = divide_exact(2013,10)
    Expecting nothing
    ok
    Trying:
        q
    Expecting:
        201
    ok
    Trying:
        r
    Expecting:
        3
    ok
    1 items had no tests:
        ex
    1 items passed all tests:
    3 tests in ex.divide_exact
    3 tests in 2 items.
    3 passed and 0 failed.
    Test passed.
```

## 代码测试

` assert` 如果表达式为假，抛出后面的字符串
``` python
    assert fib(8) == 13, 'The 8th Fibonacci number should be 13'
```

可以定义测试函数：
``` python
    def fib_test():
        assert fib(2) == 1, 'The 2nd Fibonacci number should be 1'
        assert fib(3) == 1, 'The 3rd Fibonacci number should be 1'
        assert fib(50) == 7778742049, 'Error at the 50th Fibonacci number'
```

可以使用doctring 来测试函数：
``` python
    def sum_naturals(n):
        """Return the sum of the first n natural numbers.

        >>> sum_naturals(10)
        55
        >>> sum_naturals(100)
        5050
        """
        total, k = 0, 1
        while k <= n:
            total, k = total + k, k + 1
        return total
```
可以使用doctest 库中的函数直接测试，如下测试全局环境中的函数：
``` python
    >>> from doctest import testmod
    >>> testmod()
    TestResults(failed=0, attempted=2)
```
也可以指定单一的函数,使用库中的方法` run_docstring_examples`就可以实现。第一个参数是待测试的函数，第二个参数
``` python
    >>> from doctest import run_docstring_examples
    >>> run_docstring_examples(sum_naturals, globals(), True)
    Finding tests in NoName
    Trying:
        sum_naturals(10)
    Expecting:
        55
    ok
    Trying:
        sum_naturals(100)
    Expecting:
        5050
    ok
```
` python3 -m doctest <python_source_file>` 测试文件中的内容。

## lambda表达式
``` python
    >>> square = lambda x:x*x
    >>> square(12)
    144
    >>> square
    <function <lambda> at 0xf3f490>
```

## Function Decorators
``` python

def trace(fn):
    """
    fn: 一个函数参数
    """
    def traced(x):
        print('Calling',fn,'on argument',x)
        return fn(x)
    return traced
## 以下两个等价
@trace
def triple(x):
    return 3*x

def triple(x):
    return 3*x
triple = trace(triple)
```
## Currying
将需要输入两个参数的函数转化为一个：
``` python
>>> def curried_pow(x):
        def h(y):
            return pow(x, y)
        return h

>>> curried_pow(2)(3)
8
```
使用时，例如需要计算多次2的次幂：
``` python
>>> pow_2 = curried_pow(2)
>>> pow_2(3)
8
>>> pow_2(4)
16
>>> pow_2(10)
1024
```


