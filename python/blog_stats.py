import re
import operator
from itertools import *

# g '^author: ' > /tmp/out.txt
path = '/tmp/out.txt'
with open(path) as f:
    lines = f.readlines()


def selector(line):
    if not re.search(r'@', line) is None:
        return True
    return False


def cleaner(line):
    new_line = re.sub(r'^.* ', '', line)
    new_line = re.sub(r'\n', '', new_line)
    return new_line

new_lines = list(map(cleaner, filter(selector, lines)))
list.sort(new_lines)

for k, v in groupby(new_lines):
    print("-------------------------")
    print(k)
    print(len(list(v)))

stats = { k: len(list(v)) for k, v in groupby(new_lines)}

print(stats)
