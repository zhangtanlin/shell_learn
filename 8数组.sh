#!/bin/bash

# 数组
# * Shell 没有限制数组的大小，理论上可以存放无限量的数据。数组元素的下标也是从 0 开始计数；
# *获取数组中的元素要使用下标[]，下标可以是一个整数，也可以是一个结果为整数的表达式；但是下标必须大于等于 0 ；
# *遗憾的是，常用的 Bash Shell 只支持一维数组，不支持多维数组；
# * Shell 中使用()来表示数组，数组元素之间用空格来分隔。
# 注意 1 ：数组的赋值号=两边不能有空格【和变量一样】，必须紧挨着数组名和数组元素。
# 注意 2 ： Shell 是弱类型的，它并不要求所有数组元素的类型必须相同。
first_array=(5 2 0 "ni" "ai" "wo" "?" true)
echo "获取数组“first_array”内第5个值：${first_array[4]}" # 数组获取的是序列号

# 给数组赋值
second_array=()
second_array[1]="nv"
third_array=([1]="nv" [3]="ai" [4]="ni")
echo "给“ second_array ”数组的1序号赋值后，结果为：${second_array[*]}"    # 数组一般使用序列号获取，使用“*”、“@”表示获取数组中的所有元素。
echo "给“ third_array ”数组的1,3,4,序号赋值后，结果为：${third_array[*]}" # 数组一般使用序列号获取，使用“*”、“@”表示获取数组中的所有元素。
echo "使用“@”获取“ third_array ”为：${third_array[@]}"                   # 数组一般使用序列号获取，使用“*”、“@”表示获取数组中的所有元素。

# 获取数组长度
# *使用“#”可以可以获取数组元素的个数。
# 语法： ${#array_name[*]} 或者 ${#array_name[@]}
fourth_array=(wo ai ni【亲爱的祖国】)
echo "数组“ fourth_array ”长度为：${#fourth_array[*]}"
echo "通过下标获取数组“ fourth_array ”第3个值的长度为：${#fourth_array[2]}"

# 删除数组
# 语法： unset array_name[index]
# 注意： 如果不写下标，则删除的是整个数组
fifth_array=(wo ai 祖国)
unset fifth_array[2]
echo "删除“ fifth_array ”第三个值后的结果为： ${fifth_array[*]}"
unset fifth_array
echo "删除“ fifth_array ”所有元素后结果为： ${fifth_array[*]}"

# 数组拼接（合并）
# *思路： 先利用“@”或“*”，将数组扩展成列表，然后再合并到一起。

sixth_one=(wo ai ni)
sixth_two=(ni ai wo)
sixth=(${sixth_one[*]} ${sixth_two[@]})
echo "合并 sixth_one 和 sixth_two 后的结果为：${sixth[*]}"

