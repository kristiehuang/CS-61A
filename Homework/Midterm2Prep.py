class Animal():
    def __init__(self, name):
        self.name = name 
    def bark(self):
        print("Bark!!")

an = Animal("Dory")
an.no = ['hello']
print(an.no)

Animal('Daniel').bark()

class Ok:
    py = [3.14]
    no = 23
    def __init__(self, py):
        self.ok = self.py
        Ok.py.append(3 * py)
    def my(self, eye):
        print(self.my(eye))
        return self.ok.pop()
    def __str__(self):
        return str(self.ok)[:4]
    def __repr__(self):
        return '<bears>'
class Go(Ok):
    def my(self, help):
        return [help+3, len(Ok.py)]
oh = Go(5)
Go.py = [3, 1, 4]
oh.no = {'just': 999}
print(Go.py, oh.no)
#Ok('go').my(5)


def integers(n):
    while True:
        yield n
        n+=1
def drop(n, s):
    for _ in range(n):
        next(s)
    for elem in s:
        yield elem

# def powers_of_two(ints):
#     curr = lambda: drop(1, iter(integers(1)))
#     yield curr() ** 2
#     yield from drop(curr(), powers_of_two(ints))

# p = powers_of_two(integers(1))
# next(p)
# #next(p)


def in_nested(v, L):
    if L == [] or type(L) == int:
        return False if L == [] else v == L
    else:
        return v==L[0] or in_nested(v, L[1:]) if type(L[0]) == int else in_nested(v, L[0]) or in_nested(v, L[1:])


        in_nested(0, [[1, 2], 3, [[[4],0]]])



class Link:
    """A linked list.

    >>> s = Link(1)
    >>> s.first
    1
    >>> s.rest is Link.empty
    True
    >>> s = Link(2, Link(3, Link(4)))
    >>> s.first = 5
    >>> s.rest.first = 6
    >>> s.rest.rest = Link.empty
    >>> s                                    # Displays the contents of repr(s)
    Link(5, Link(6))
    >>> s.rest = Link(7, Link(Link(8, Link(9))))
    >>> s
    Link(5, Link(7, Link(Link(8, Link(9)))))
    >>> print(s)                             # Prints str(s)
    <5 7 <8 9>>
    """
    empty = ()

    def __init__(self, first, rest=empty):
        assert rest is Link.empty or isinstance(rest, Link)
        self.first = first
        self.rest = rest

    def __repr__(self):
        if self.rest is not Link.empty:
            rest_repr = ', ' + repr(self.rest)
        else:
            rest_repr = ''
        return 'Link(' + repr(self.first) + rest_repr + ')'

    def __str__(self):
        string = '<'
        while self.rest is not Link.empty:
            string += str(self.first) + ' '
            self = self.rest
        return string + str(self.first) + '>'


link = Link(1, Link(2, Link(3)))
def hi(link):
    #link, link.rest = link.rest.rest, link.rest.rest
    print("he")
    return link
print(hi(link))
print("hi there")
print(link)




def tree(label, branches=[]):
    return [label] + list(branches)
def label(tree):
    return tree[0]
def branches(tree):
    return tree[1:]
def print_tree_adt(t, indent=0):
    print(' ' * indent + str(label(t)))
    for b in branches(t):
        print_tree_adt(b, indent + 1)
class Tree:
    def __init__(self, label, branches=[]):
        self.label = label
        self.branches = list(branches)
    def __str__(self):
        return '\n'.join(self.indented())
    def indented(self, k=0):
        ind = []
        for b in self.branches:
            for line in b.indented(k + 1):
                ind.append(' ' + line)
        return [str(self.label)] + ind