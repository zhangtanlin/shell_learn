#!/bin/bash

# 字符串（String）是一系列字符的组合。
# 字符串可以由单引号''包围，也可以由双引号""包围，也可以不用引号。
# *单引号包围的字符串：任何字符都会原样输出，在其中使用变量是无效的。字符串中不能出现单引号，即使对单引号进行转义也不行。
# *双引号包围的字符串：如果其中包含了某个变量，那么该变量会被解析（得到该变量的值），而不是原样输出。字符串中可以出现双引号，只要它被转义了就行。
# *不被引号包围的字符串：不被引号包围的字符串中出现变量时也会被解析，这一点和双引号""包围的字符串一样。字符串中不能出现空格，否则空格后边的字符串会作为其他变量或者命令解析。
n=9999
str1=www.juguozhonglin.ltd$n str2="shell \"script\" 'woaini' $n"
str3='shell应该属于c语言范畴吧： $n'
echo $str1 # str1 中包含了$n，它被解析为变量 n 的引用。$n后边有空格，紧随空格的是 str2；Shell 将 str2 解释为一个新的变量名，而不是作为字符串 str1 的一部分。
echo $str2 # str2 中包含了引号，但是被转义了（由反斜杠\开头的表示转义字符）。str2 中也包含了$n，它也被解析为变量 n 的引用。
echo $str3 # str3 中也包含了$n，但是仅仅是作为普通字符，并没有解析为变量 n 的引用。

# 取字符串长度
str="www.juguozhonglin.ltd"
echo "字符串 str 的长度是：${#str}"

# 字符串拼接
name="url地址是"
url="www.juguozhonglin.top"
str4=$name$url
str5="$name $url"
str6=$name": "$url
str7="$name: $url"
str8="${name}Script: ${url}index.html"
echo $str4 # 中间不能有空格【因为当字符串不被任何一种引号包围时，遇到空格就认为字符串结束了】。
echo $str5 # 如果被双引号包围，那么中间可以有空格。
echo $str6 # 中间可以出现别的字符串。
echo $str7 # 这样写也可以。
echo $str8 # 变量被包围时，这需要给变量名加上大括号【加{}是为了帮助解释器识别变量的边界】。

# 字符串截取
# 语法一： ${string: start :length} 从左边开始计数【非序列号】；
# 语法二： ${string: 0-start :length}。
# *开始计数时，起始数字是 0（这符合程序员思维）。不管从哪边开始计数，截取方向都是从左到右。
url="www.juguozhonglin.ltd"
echo "截取{2,9}后结果为：${url: 2: 9}"
echo "截取{5}后结果为：${url: 4}"                      # 省略 length，截取到字符串末尾。
echo "从右边开始截取{0-13, 9}后结果为：${url: 0-12: 5}" # 这种格式仅仅多了0-，是固定的写法，专门用来表示从字符串右边开始计数。

# 截取指定字符串右边所有字符【不包含截取的值】
# *这种截取方式无法指定字符串长度，只能从指定字符（子字符串）截取到字符串末尾。
# 使用“#”号可以截取指定字符（或者子字符串）右边的所有字符。
# *语法： ${string#*chars}
# string 表示被截取的字符串；
# chars 是指定的字符（或者子字符串）；
# “*”号是通配符的一种，表示任意长度的字符串【如果去掉*号则从开头开始匹配，开头没有指定值则返回原值】；
# “*chars”连起来使用的意思是：忽略左边的所有字符，直到遇见 chars（chars 不会被截取）。
stringCharsRight="这是一个待截取的url，http://www.juguozhonglin.ltd"
echo "指定字符串截取“:”结果为：${stringChars#*:}"             # 结果为“//www.juguozhonglin.ltd”
echo "指定字符串截取“ttp”结果为：${stringChars#*ttp}"         # 结果为“://www.juguozhonglin.ltd”
echo "指定字符串截取“”结果为：${stringChars#*.}"              # 结果为“juguozhonglin.ltd”
echo "去掉*号匹配截取“这是”结果为：${stringChars#这是}"        # 结果为“一个待截取的url，http://www.juguozhonglin.ltd”
echo "从最后一个匹配的“.”开始截取结果为：${stringChars##*.}"   # 结果为“ltd”

# 截取指定字符串左边所有字符【不包含截取的值】
# 使用%号可以截取指定字符（或者子字符串）左边的所有字符。
# *语法： ${string%chars*}
# 请注意“*”的位置，因为要截取 chars 左边的字符，而忽略 chars 右边的字符，所以“*”应该位于 chars 的右侧，其他方面%和#的用法相同。
stringCharsLeft="http://www.juguozhonglin.top是一个待截取的url"
echo "从左边开始截取“/”字符串，结果为：${stringCharsLeft%/*}"         # 结果为 http://c.biancheng.net
echo "从左边开始截取最后一个“/”字符串，结果为：${stringCharsLeft%%/*}" # 结果为 http:

# 八种截取字符串的方法汇总
# ${string: start :length}	 #从 string 字符串的左边第 start 个字符开始，向右截取 length 个字符。
# ${string: start}	         #从 string 字符串的左边第 start 个字符开始截取，直到最后。
# ${string: 0-start :length} #从 string 字符串的右边第 start 个字符开始，向右截取 length 个字符。
# ${string: 0-start}	     #从 string 字符串的右边第 start 个字符开始截取，直到最后。
# ${string#*chars}	         #从 string 字符串第一次出现 *chars 的位置开始，截取 *chars 右边的所有字符。
# ${string##*chars}	         #从 string 字符串最后一次出现 *chars 的位置开始，截取 *chars 右边的所有字符。
# ${string%*chars}	         #从 string 字符串第一次出现 *chars 的位置开始，截取 *chars 左边的所有字符。
# ${string%%*chars}	         #从 string 字符串最后一次出现 *chars 的位置开始，截取 *chars 左边的所有字符
