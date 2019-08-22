#!/bin/bash

# 内置命令 test
# test 是 Shell 内置命令，用来检测某个条件是否成立。通常和 if 语句一起使用，并且大部分 if 语句都依赖 test。
# 语法： test expression
# 语法释义：当 test 判断 expression 成立时，退出状态为 0 ，否则为非 0 值。
# 语法注意1： test 命令也可以简写为 [] ，它的用法为： [ expression ] 。
# 语法注意2： test 和 [] 是等价的。
# 与文件检测相关的 test 选项：
# *文件类型判断
# test -b filename	           # 判断文件是否存在，并且是否为块设备文件。
# test -c filename	           # 判断文件是否存在，并且是否为字符设备文件。
# test -d filename	           # 判断文件是否存在，并且是否为目录文件。
# test -e filename	           # 判断文件是否存在。
# test -f filename	           # 判断文件是否存在，井且是否为普通文件。
# test -L filename	           # 判断文件是否存在，并且是否为符号链接文件。
# test -p filename	           # 判断文件是否存在，并且是否为管道文件。
# test -s filename	           # 判断文件是否存在，并且是否为非空。
# test -S filename	           # 判断该文件是否存在，并且是否为套接字文件。
# *文件权限判断
# test -r filename	           # 判断文件是否存在，并且是否拥有读权限。
# test -w filename	           # 判断文件是否存在，并且是否拥有写权限。
# test -x filename	           # 判断文件是否存在，并且是否拥有执行权限。
# test -u filename      	     # 判断文件是否存在，并且是否拥有 SUID 权限。
# test -g filename	           # 判断文件是否存在，并且是否拥有 SGID 权限。
# test -k filename	           # 判断该文件是否存在，并且是否拥有 SBIT 权限。
# *文件比较
# test filename1 -nt filename2 # 判断 filename1 的修改时间是否比 filename2 的新。
# test filename -ot filename2	 # 判断 filename1 的修改时间是否比 filename2 的旧。
# test filename1 -ef filename2 # 判断 filename1 是否和 filename2 的 inode 号一致，可以理解为两个文件是否为同一个文件。这个判断用于判断硬链接是很好的方法
# 与数值比较相关的 test 选项：
# test num1 -eq num2	         # 判断 num1 是否和 num2 相等。
# test num1 -ne num2	         # 判断 num1 是否和 num2 不相等。
# test num1 -gt num2	         # 判断 num1 是否大于 num2 。
# test num1 -lt num2	         # 判断 num1 是否小于 num2。
# test num1 -ge num2	         # 判断 num1 是否大于等于 num2。
# test num1 -le num2	         # 判断 num1 是否小于等于 num2。
# 与字符串判断相关的 test 选项：
# test -z str	                 # 判断字符串 str 是否为空。
# test -n str	                 # 判断宇符串 str 是否为非空。
# test str1 = str2             # =和==是等价的，都用来判断 str1 是否和 str2 相等。
# test str1 == str2	           # =和==是等价的，都用来判断 str1 是否和 str2 相等。
# test str1 != str2	           # 判断 str1 是否和 str2 不相等。
# test str1 \> str2	           # 判断 str1 是否大于 str2。\>是>的转义字符，这样写是为了防止>被误认为成重定向运算符。
# test str1 \< str2	           # 判断 str1 是否小于 str2。同样，\<也是转义字符。
# 注意1：
# test 和 [] 都是命令，一个命令本质上对应一个程序或者一个函数。即使是一个程序，它也有入口函数，例如C语言程序的入口函数是 main()，运行C语言程序就从 main() 函数开始，所以也可以将一个程序等效为一个函数，这样我们就不用再区分函数和程序了，直接将一个命令和一个函数对应起来即可。
# 有了以上认知，就很容易看透命令的本质了：使用一个命令其实就是调用一个函数，命令后面附带的选项和参数最终都会作为实参传递给函数。
# 假设 test 命令对应的函数是 func() ，使用 test -z $str1 命令时，会先将变量 $str1 替换成字符串：
# 如果 $str1 是一个正常的字符串，比如 “abc123”，那么替换后的效果就是 test -z abc123 ，调用 func() 函数的形式就是 func("-z abc123") 。test 命令后面附带的所有选项和参数会被看成一个整体，并作为实参传递进函数。
# *如果 $str1 是一个空字符串，那么替换后的效果就是test -z ，调用 func() 函数的形式就是func("-z ")，这就比较奇怪了，因为-z选项没有和参数成对出现，func() 在分析时就会出错。
# 如果我们给 $str1 变量加上双引号，当 $str1 是空字符串时， test -z "$str1" 就会被替换为 test -z "" ，调用 func() 函数的形式就是 func("-z \"\"") ，很显然， -z 选项后面跟的是一个空字符串（\"表示转义字符），这样 func() 在分析时就不会出错了。
# 所以，当你在 test 命令中使用变量时，我强烈建议将变量用双引号 "" 包围起来，这样能避免变量为空值时导致的很多奇葩问题。
# 注意2：
# test 命令比较奇葩， > 、 < 、 == 只能用来比较字符串【重点】，不能用来比较数字；
# 比较数字需要使用 -eq 、-gt 等选项【重点】；
# 不管是比较字符串还是数字，test 都不支持 >= 和 <= 【重点】。
# 对于整型数字的比较，建议使用 (()) 。 (()) 支持各种运算符，写法也符合数学规则，用起来更加方便；
# 几乎完全兼容 test ，并且比 test 更加强大，比 test 更加灵活的是 [[]] ； [[]] 不是命令，而是 Shell 关键字。

# 判断文件是否存在，并且是否拥有写入权限
read filename1 # 建议使用：“13_0测试文件【读写权限】.txt”文件地址
if( test -w $filename1 ); then
echo "文件“$filename1”存在，并且有写入权限。"
fi

# 对数值进行比较
# 使用 (()) 可以进行比较， test 也可以进行比较。
# * -le 表示小于等于， -ge 选项表示大于等于， && 是逻辑与运算符。
read age
if test $age -le 2; then
    echo "婴儿"
elif test $age -ge 3 && test $age -le 8; then
    echo "幼儿"
elif [ $age -ge 9 ] && [ $age -le 17 ]; then
    echo "少年"
elif [ $age -ge 18 ] && [ $age -le 25 ]; then
    echo "成年"
elif test $age -ge 26 && test $age -le 40; then
    echo "青年"
elif test $age -ge 41 && [ $age -le 60 ]; then
    echo "中年"
else
    echo "老年"
fi

# 对字符串判定
read str1
read str2
if test -z "$str1" || [ -z "$str2" ] # 验证字符串是否为空
then
  echo "字符串不能为空"
  echo 0
fi

# 对字符串进行比较
# 注意：如果 str3 或者 str4 有空值，这是比较表达式就变成 [=$str4] ,这样会报错“[: =: unary operator expected”，应该把表达式改为 [[$str3 = $str4]]
read str3
read str4
if [ "$str3" = "$str4" ] # 比较字符串。 常规写法应该是 [$str3 = $str4] ,但是如果有空值会报错，所以采用 ["$str3" = "$str4"] 【参考注意事项最后一条】
then
  echo "两个字符串相等"
else
  echo "两个字符串不相等"
fi
