import pytest
import random
from sort import QuickSort


def test_benchmark(benchmark):
    source = []
    max = 500000
    for i in range(max):
        source.append(random.randrange(max))

    benchmark(QuickSort.sort, source)


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

