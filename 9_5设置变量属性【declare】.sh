#!/bin/bash

# declare 和 typeset 都是 Shell 内建命令，它们的用法相同，都用来设置变量的属性。
# * typeset 已经被弃用了，建议使用 declare 代替。
# 语法： declare [+/-] [aAfFgilprtux] [变量名=变量值]
# “-”表示设置属性，“+”表示取消属性， aAfFgilprtux 是具体的选项，它们的含义如下表所示：
# -f [name]	      列出之前由用户在脚本中定义的函数名称和函数体。
# -F [name]	      仅列出自定义函数名称。
# -g name	        在 Shell 函数内部创建全局变量。
# -p [name]	      显示指定变量的属性和值。
# -a name	        声明变量为普通数组。
# -A name	        声明变量为关联数组（支持索引下标为字符串）。
# -i name 	      将变量定义为整数型。
# -r name[=value] 将变量定义为只读（不可修改和删除），等价于 readonly name。
# -x name[=value]	将变量设置为环境变量，等价于 export name[=value]。

# 将变量声明为整数并进行计算
declare -i number1 number2 sumNumber  #将多个变量声明为整数
number1=10                  # 给 number1 变量设值
number2=30                  # 给 number2 变量设值
sumNumber=$number1+$number2 # 计算 sumNumber 的值
echo $sumNumber             # 输出

# 将变量定义为只读变量
declare -r number3=985
unumber3=221                # 这个赋值没有成功，因为 number3 是只读的值
echo $number3

# 显示变量的属性和值
declare -r number4=100
declare -p number4          # 输出：“declare -r number4=100”