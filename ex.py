"""第一份 python 源文件"""

from operator import floordiv,mod

def divide_exact(n,d=10):
    """返回商和余数n/d.

    >>> q,r = divide_exact(2013,10)
    >>> q
    201
    >>> r
    3
    """
    return floordiv(n,d),mod(n,d)



