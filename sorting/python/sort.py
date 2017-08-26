
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

