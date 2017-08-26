import pytest
import random
from sort import QuickSort, MergeSort


def test_benchmark(benchmark):
    source = []
    max = 500000
    for i in range(max):
        source.append(random.randrange(max))

    # benchmark(QuickSort.sort, source)
    benchmark(MergeSort.sort, source) # Core Dump !!!


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


def test_msort_one_value_array():
    source = [1]
    result = MergeSort.sort(source)

    assert source == result


def test_msort_empty_array():
    source = []
    result = MergeSort.sort(source)

    assert source == result


def test_msort():
    source = [9, 8, 7, 6, 5, 4, 3, 2, 1]
    expected = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    result = MergeSort.sort(source)

    assert result == expected

