require "minitest/autorun"
require "./sort.rb"

require 'benchmark'

class TestBenchmark < Minitest::Test

  def setup
    @ars = []
    (1..4).each{ @ars.push([]) }
    max = 500000
    (1..max).each do |i|
      @ars.each{|ar| ar.push(Kernel.rand(max)) }
    end
  end

  def test_benchmark
    Benchmark.bm do |b|
      b.report { puts "QSort"; QSort.sort(@ars[0])}
      # b.report { puts "Merge Sort"; MergeSort.sort(@ars[1])}
      # b.report { puts "Bubble Sort"; BubbleSort.sort(@ars[2])}
      b.report { puts "Binary Tree Sort"; BinaryTreeSort.sort(@ars[3])}
    end
  end

end

class TestQSort < Minitest::Test

  def test_one_value_array
    ar = [1]
    res = QSort.sort(ar)
    assert_equal ar, res
  end

  def test_empty_array
    ar = []
    res = QSort.sort(ar)
    assert_equal ar, res
  end

  def test_qsort1
    ar = [9, 8, 7, 6, 5, 4, 3, 2, 1]
    res = QSort.sort([9, 8, 7, 6, 5, 4, 3, 2, 1])
    assert_equal ar.sort, res
  end
end

class TestMergeSort < Minitest::Test

  def test_merge_empty_array
    a = []
    b = []
    assert_equal [], MergeSort.mergeList(a,b)
  end

  def test_merge1
    a = [1, 5, 9]
    b = [3, 7, 8]
    assert_equal (a + b).sort, MergeSort.mergeList(a,b)
  end

  def test_one_value_array
    ar = [1]
    res = MergeSort.sort(ar)
    assert_equal ar, res
  end

  def test_empty_array
    ar = []
    res = MergeSort.sort(ar)
    assert_equal ar, res
  end

  def test_sort1
    ar = [9, 8, 7, 6, 5, 4, 3, 2, 1]
    res = MergeSort.sort([9, 8, 7, 6, 5, 4, 3, 2, 1])
    assert_equal ar.sort, res
  end

end

class TestBubbleSort < Minitest::Test

  def test_one_value_array
    ar = [1]
    res = BubbleSort.sort(ar)
    assert_equal ar, res
  end

  def test_empty_array
    ar = []
    res = BubbleSort.sort(ar)
    assert_equal ar, res
  end

  def test_sort1
    ar = [9, 8, 7, 6, 5, 4, 3, 2, 1]
    res = BubbleSort.sort([9, 8, 7, 6, 5, 4, 3, 2, 1])
    assert_equal ar.sort, res
  end
end

class TestBinaryTreeSort < Minitest::Test
  def test_flatten_empty_tree
    tree = [nil, 4, nil]
    assert_equal [4], BinaryTreeSort.flatten(tree)
  end

  def test_flatten_empty_tree
    tree = [[nil, 3, nil], 4, [nil, 5, nil]]
    assert_equal [3, 4, 5], BinaryTreeSort.flatten(tree)
  end

  def test_insert
    tree = [nil, 4, nil]
    tree = BinaryTreeSort.insert(tree, 3)
    tree = BinaryTreeSort.insert(tree, 5)
    assert_equal [[nil, 3, nil], 4, [nil, 5, nil]], tree
  end

  def test_sort1
    ar = [9, 8, 7, 6, 5, 4, 3, 2, 1]
    res = BinaryTreeSort.sort([9, 8, 7, 6, 5, 4, 3, 2, 1])
    assert_equal ar.sort, res
  end
end


