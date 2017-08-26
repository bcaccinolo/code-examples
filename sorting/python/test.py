import pytest
import random
from sort import QuickSort, MergeSort, TreeSort


###############################################################################
# BENCHMARK
###############################################################################

def test_benchmark(benchmark):
    source = []
    max = 500000
    for i in range(max):
        source.append(random.randrange(max))

    benchmark(QuickSort.sort, source)
    # benchmark(MergeSort.sort, source)  # Core Dump !!!
    benchmark(TreeSort.sort, source)


###############################################################################
# QUICK SORT
###############################################################################

def test_qsort_one_value_array():
    source = [1]
    result = QuickSort.sort(source)

    assert source == result


def test_qsort_empty_array():
    source = []
    result = QuickSort.sort(source)

    assert source == result


def test_qsort():
    source = [9, 8, 7, 6, 5, 4, 3, 2, 1]
    expected = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    result = QuickSort.sort(source)

    assert result == expected


###############################################################################
# MERGE SORT
###############################################################################

def test_msort_merge1():
    ar1 = [1, 5, 9]
    ar2 = [2, 6, 10]
    expected = [1, 2, 5, 6, 9, 10]
    result = MergeSort.merge(ar1, ar2)

    assert expected == result


def test_msort_merge2():
    ar1 = []
    ar2 = []
    expected = []
    result = MergeSort.merge(ar1, ar2)

    assert expected == result


def test_msort1():
    source = [1]
    result = MergeSort.sort(source)

    assert source == result


def test_msort2():
    source = []
    result = MergeSort.sort(source)

    assert source == result


def test_msort3():
    source = [9, 8, 7, 6, 5, 4, 3, 2, 1]
    expected = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    result = MergeSort.sort(source)

    assert result == expected


###############################################################################
# TREE SORT
###############################################################################

def test_tree0():
    source = [4, 2, 3, 1]
    expected = [None, 1, [[None, 2, [None, 3, None]], 4, None]]
    result = TreeSort.build_tree(source)

    assert expected == result


def test_tree1():
    source = [1, 2, 3]
    expected = [[None, 1, [None, 2, None]], 3, None]
    result = TreeSort.build_tree(source)

    assert expected == result


def test_tree2():
    source = []
    expected = None
    result = TreeSort.build_tree(source)

    assert expected == result


def test_tree3():
    source = [1]
    expected = [None, 1, None]
    result = TreeSort.build_tree(source)

    assert expected == result


def test_flatten1():
    source = None
    expected = []
    result = TreeSort.flatten(source)

    assert expected == result


def test_flatten2():
    source = [None, 1, None]
    expected = [1]
    result = TreeSort.flatten(source)

    assert expected == result


def test_flatten3():
    source = [None, 1, [[None, 2, [None, 3, None]], 4, None]]
    expected = [1, 2, 3, 4]
    result = TreeSort.flatten(source)

    assert expected == result


def test_tree_sort1():
    source = [1]
    result = TreeSort.sort(source)

    assert source == result


def test_tree_sort2():
    source = []
    result = TreeSort.sort(source)

    assert source == result


def test_tree_sort3():
    source = [9, 8, 7, 6, 5, 4, 3, 2, 1]
    expected = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    result = TreeSort.sort(source)

    assert result == expected
