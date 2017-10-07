import sys

sys.setrecursionlimit(50000000)


class QuickSort(object):

    def __init__(self):
        pass

    @staticmethod
    def sort(ar):
        if len(ar) < 1:
            return ar

        pivot = ar[0]
        part1 = []
        part2 = []
        for v in ar[1:len(ar)]:
            if v > pivot:
                part2.append(v)
            else:
                part1.append(v)

        return QuickSort.sort(part1) + [pivot] + QuickSort.sort(part2)


class MergeSort(object):

    @staticmethod
    def merge(ar1, ar2):
        if len(ar1) == 0:
            return ar2

        if len(ar2) == 0:
            return ar1

        if ar1[0] > ar2[0]:
            return [ar2[0]] + MergeSort.merge(ar1, ar2[1:len(ar2)])
        else:
            return [ar1[0]] + MergeSort.merge(ar1[1:len(ar1)], ar2)

    @staticmethod
    def sort(ar):

        # print(ar)

        if len(ar) <= 1:
            return ar

        middle = len(ar)/2
        ar1 = ar[0:middle]
        ar2 = ar[middle:len(ar)]
        return MergeSort.merge(MergeSort.sort(ar1), MergeSort.sort(ar2))


class TreeSort(object):

    @staticmethod
    def sort(array):
        return TreeSort.flatten(TreeSort.build_tree(array))

    @staticmethod
    def build_tree(source):
        array = source[:]  # we do a copy of the list

        if len(array) == 0:
            return None

        root = array.pop()
        tree = [None, root, None]

        for e in array:
            tree = TreeSort.add_elem(tree, e)

        return tree

    @staticmethod
    def add_elem(tree, elem):
        if not tree:
            return [None, elem, None]

        if elem >= tree[1]:
            return [tree[0], tree[1], TreeSort.add_elem(tree[2], elem)]
        else:
            return [TreeSort.add_elem(tree[0], elem), tree[1], tree[2]]

    @staticmethod
    def flatten(tree):
        if tree is None:
            return []

        return TreeSort.flatten(tree[0]) + [tree[1]] + TreeSort.flatten(tree[2])


