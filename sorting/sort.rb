
# Quick sort - Tri rapide
module QSort
  def self.sort(ar)
    return ar if ar.size <= 1

    pivot = ar.pop
    sub1 = []
    sub2 = []

    ar.each do |elem|
      (elem <= pivot) ? sub1.push(elem) : sub2.push(elem)
    end

    sort(sub1) + [pivot] + sort(sub2)
  end
end

# Merge sort - Tri fusion
module MergeSort

  # merge 2 ordered lists
  def self.mergeList(a, b)
    return b if a.empty?
    return a if b.empty?
    (a[0] <= b[0] ? [a.delete_at(0)] : [b.delete_at(0)]) + mergeList(a, b)
  end

  def self.sort(ar)
    return ar if ar.size <= 1
    a = ar.slice!(0..(ar.size/2 - 1))
    mergeList(sort(a), sort(ar))
  end
end

# Bubble sort
module BubbleSort
  def self.sort(ar)
    return ar if ar.size <= 1

    loop do
      swapped = false
      for i in 0..(ar.size - 2) do
        if ar[i] > ar[i + 1]
          ar[i], ar[i + 1] = ar[i + 1], ar[i]
          swapped = true
        end
      end
      break if swapped == false
    end
    return ar
  end
end

# Binary tree sort - Tri arborescent
# Tree struct: [leftTree, value, rightTree]
module BinaryTreeSort

  # building the tree
  def self.insert(tree, value)
    return [nil, value, nil] if tree.nil?
    if value <= tree[1]
      [insert(tree[0], value), tree[1], tree[2]]
    else
      [tree[0], tree[1], insert(tree[2], value)]
    end
  end

  # convert the tree to an array
  def self.flatten(tree)
    return [] if tree.nil?
    flatten(tree[0]) + [tree[1]] + flatten(tree[2])
  end

  def self.sort(ar)
    return ar if ar.size <= 1
    tree = nil
    ar.each do |elem|
      tree = insert(tree, elem)
    end
    return flatten(tree)
  end
end