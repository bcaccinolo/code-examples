from bs4 import BeautifulSoup

filename = "http_codes.html"
fd = open(filename)
soup = BeautifulSoup(fd, "html.parser")


def extract_http_code(th):
    """ extract the http code from its td tag """
    try:
        code = int(th.contents[0])
        return code
    except ValueError:
        print("this td is not a code %s" % th.contents)
    except TypeError:
        print("this td is not a code %s" % th.contents)


def extract_http_desc(td):
    """ extract the description of the http code from the td tag """
    result = td.select("span > i")
    if not len(result) == 0:
        for tag in result:
            return tag.contents[0]


def extract_table_line(tr):
    """ extract the content from a table line in an array ready to be used. """
    result = []

    th = tr.find("th")
    if th:
        result.append(extract_http_code(th))

    td = tr.find("td")
    if td:
        result.append(extract_http_desc(td))

    return result


tables = soup.find_all("table")
codes = []
for table in tables:
    trs = table.find_all("tr")
    for tr in trs:
        res = extract_table_line(tr)
        if len(res) == 2:
            codes.append(res)

print(codes)
