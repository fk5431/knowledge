#!/user/bin/env python
# coding=utf-8
import re
file_object = open('1.txt')

#str = '<a href="${pageContext.request.contextPath}/searchtravelplace?place=10035" target="_blank">成fff都</a>'
list_of_all_the_lines = file_object.readlines( )
s1 = ''
s2 = ''
for str in list_of_all_the_lines:
    if str == '\n':
        continue
    for x in str:
        try:
            int(x)
        except :
            s1 += x
    pattern = re.compile('>(.*?)<', re.S)
    items = re.findall(pattern, s1)
    s2 = items[0]
    print s1[:69] + s2 + s1[68:]
    s1 = ''
    s2 = ''
