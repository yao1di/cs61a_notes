def make_even(t):
    """
    >>> t = Tree(1, [Tree(2, [Tree(3)]), Tree(4), Tree(5)])
    >>> make_even(t)
    >>> t.label
    2
    >>> t.branches[0].branches[0].label
    4
    """
    "*** YOUR CODE HERE ***"
    if t.label%2!=0:
        t.label += 1
        for b in t.branches:
            make_even(b)
    else:
        for b in t.branches:
            make_even(b)
    # 答案如下，也就是上面代码简化之后的结果
    #if t.label%2!=0:
    #    t.label += 1
    #for b in t.branches:
    #        make_even(b)
    


def cumulative_mul(t):
    """Mutates t so that each node's label becomes the product 
    of all labels in    the corresponding subtree rooted at t.

    >>> t = Tree(1, [Tree(3, [Tree(5)]), Tree(7)])
    >>> cumulative_mul(t)
    >>> t
    Tree(105, [Tree(15, [Tree(5)]), Tree(7)])
    >>> otherTree = Tree(2, [Tree(1, [Tree(3), Tree(4), Tree(5)]), Tree(6, [Tree(7)])])
    >>> cumulative_mul(otherTree)
    >>> otherTree
    Tree(5040, [Tree(60, [Tree(3), Tree(4), Tree(5)]), Tree(42, [Tree(7)])])
    """
    "*** YOUR CODE HERE ***"
    if t.is_leaf():
        pass
    else:
        for b in t.branches:
            cumulative_mul(b)
            t.label *= b.label

def prune_small(t, n):
    """Prune the tree mutatively, keeping only the n branches
    of each node with the smallest labels.

    >>> t1 = Tree(6)
    >>> prune_small(t1, 2)
    >>> t1
    Tree(6)
    >>> t2 = Tree(6, [Tree(3), Tree(4)])
    >>> prune_small(t2, 1)
    >>> t2
    Tree(6, [Tree(3)])
    >>> t3 = Tree(6, [Tree(1), Tree(3, [Tree(1), Tree(2), Tree(3)]), Tree(5, [Tree(3), Tree(4)])])
    >>> prune_small(t3, 2)
    >>> t3 
    Tree(6, [Tree(1), Tree(3, [Tree(1), Tree(2)])])
    """
    while len(t.branches)>n:
        largest = max(t.branches, key=lambda x:x.label)   ## 这里要使用lambda表达式是难点
        t.branches.remove(largest)
    for b in t.branches:
        prune_small(b,n)


def is_bst(t):
    """Returns True if the Tree t has the structure of a valid BST.

    >>> t1 = Tree(6, [Tree(2, [Tree(1), Tree(4)]), Tree(7, [Tree(7), Tree(8)])])
    >>> is_bst(t1)
    True
    >>> t2 = Tree(8, [Tree(2, [Tree(9), Tree(1)]), Tree(3, [Tree(6)]), Tree(5)])
    >>> is_bst(t2)
    False
    >>> t3 = Tree(6, [Tree(2, [Tree(4), Tree(1)]), Tree(7, [Tree(7), Tree(8)])])
    >>> is_bst(t3)
    False
    >>> t4 = Tree(1, [Tree(2, [Tree(3, [Tree(4)])])])
    >>> is_bst(t4)
    True
    >>> t5 = Tree(1, [Tree(0, [Tree(-1, [Tree(-2)])])])
    >>> is_bst(t5)
    True
    >>> t6 = Tree(1, [Tree(4, [Tree(2, [Tree(3)])])])
    >>> is_bst(t6)
    True
    >>> t7 = Tree(2, [Tree(1, [Tree(5)]), Tree(4)])
    >>> is_bst(t7)
    False
    """
    "*** YOUR CODE HERE ***"
    def bst_min(t_min):
        """一个树，找到其中最小值"""
        if t_min.is_leaf():
            return t_min.label
        return min(t_min.label,bst_min(t_min.branches[0]))
    def bst_max(t_max):
        """一个树，找到其中最大值"""
        if t_max.is_leaf():
            return t_max.label
        #if len(t_max.branches)==1:
            #return max(t_max.label,bst_max(t_max.branches[0]))
        #return max(t_max.label,bst_max(t_max.branches[1]))
    ## 考虑到一般是右树的值最大，但是可能只有一个叶子，所以为最后一个分支
        return max(t_max.label,bst_max(t_max.branches[-1]))  
        
    if len(t.branches)>2:
        return False
    elif not t.is_leaf():
        if len(t.branches)==1:
            return is_bst(t.branches[0])
        elif len(t.branches)==2:
            if t.label<=bst_max(t.branches[0]) or t.label>=bst_min(t.branches[1]):
                return False
            else:
                for b in t.branches:
                    return is_bst(b) and True
    else:
        return True
    
    #if t.is_leaf():
    #    return True
    #if len(t.branches) == 1:
    #    c = t.branches[0]
    #    return is_bst(c) and (bst_max(c) <= t.label or bst_min(c) > t.label)
    #elif len(t.branches) == 2:
    #    c1, c2 = t.branches
    #    valid_branches = is_bst(c1) and is_bst(c2)
    #    return valid_branches and bst_max(c1) <= t.label and bst_min(c2) > t.label
    #else:
    #    return False


def add_trees(t1, t2):
    """
    >>> numbers = Tree(1,
    ...                [Tree(2,
    ...                      [Tree(3),
    ...                       Tree(4)]),
    ...                 Tree(5,
    ...                      [Tree(6,
    ...                            [Tree(7)]),
    ...                       Tree(8)])])
    >>> print(add_trees(numbers, numbers))
    2
      4
        6
        8
      10
        12
          14
        16
    >>> print(add_trees(Tree(2), Tree(3, [Tree(4), Tree(5)])))
    5
      4
      5
    >>> print(add_trees(Tree(2, [Tree(3)]), Tree(2, [Tree(3), Tree(4)])))
    4
      6
      4
    >>> print(add_trees(Tree(2, [Tree(3, [Tree(4), Tree(5)])]), \
    Tree(2, [Tree(3, [Tree(4)]), Tree(5)])))
    4
      6
        8
        5
      5
    """
    if not t1:
        return t2
    if not t2:
        return t1
    new_label = t1.label+t2.label
    t1_branches, t2_branches = list(t1.branches),list(t2.branches)
    length_t1, length_t2 = len(t1.branches),len(t2.branches)
    if length_t2>length_t1:
        t1_branches += [None for _ in range(length_t1,length_t2)]
    elif length_t1>length_t2:
        t2_branches += [None for _ in range(length_t2,length_t1)]
    return Tree(new_label,[add_trees(branch1,branch2) for branch1,branch2 in zip(t1_branches,t2_branches)])

    #if not t1:
    #    return t2
    #if not t2:
    #    return t1
    #new_label = t1.label + t2.label
    #t1_branches, t2_branches = list(t1.branches), list(t2.branches)
    #length_t1, length_t2 = len(t1_branches), len(t2_branches)
    #if length_t1 < length_t2:
    #    t1_branches += [None for _ in range(length_t1, length_t2)]
    #elif length_t1 > length_t2:
    #    t2_branches += [None for _ in range(length_t2, length_t1)]
    #return Tree(new_label, [add_trees(branch1, branch2) for branch1, branch2 in zip(t1_branches, t2_branches)])



class Tree:
    """
    >>> t = Tree(3, [Tree(2, [Tree(5)]), Tree(4)])
    >>> t.label
    3
    >>> t.branches[0].label
    2
    >>> t.branches[1].is_leaf()
    True
    """

    def __init__(self, label, branches=[]):
        for b in branches:
            assert isinstance(b, Tree)
        self.label = label
        self.branches = list(branches)

    def is_leaf(self):
        return not self.branches

    def __repr__(self):
        if self.branches:
            branch_str = ', ' + repr(self.branches)
        else:
            branch_str = ''
        return 'Tree({0}{1})'.format(self.label, branch_str)

    def __str__(self):
        def print_tree(t, indent=0):
            tree_str = '  ' * indent + str(t.label) + "\n"
            for b in t.branches:
                tree_str += print_tree(b, indent + 1)
            return tree_str
        return print_tree(self).rstrip()
