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


# # Merge sort - Tri fusion
# module MergeSort

#   # merge 2 ordered lists
#   def self.mergeList(a, b)
#     return b if a.empty?
#     return a if b.empty?
#     (a[0] <= b[0] ? [a.delete_at(0)] : [b.delete_at(0)]) + mergeList(a, b)
#   end

#   def self.sort(ar)
#     return ar if ar.size <= 1
#     a = ar.slice!(0..(ar.size/2 - 1))
#     mergeList(sort(a), sort(ar))
#   end
# end
