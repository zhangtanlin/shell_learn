#!/bin/bash

# 条件语句
# * if 检测的是命令的退出状态；
# 注意1：最后必须以 fi 来闭合，fi 就是 if 倒过来拼写。也正是有了 fi 来结尾，所以即使有多条语句也不需要用 {} 包围起来。
# 注意2：condition 后边的“;”分号，当 if 和 then 位于同一行的时候，这个分号是必须的，否则会有语法错误。
# 语法：
#   if condition
#   then
#     statement(s)
#   fi
# 语法释义：condition是判断条件，如果 condition 成立（返回“真”）【then 后边的语句会被执行】；如果 condition 不成立（返回“假”），不会执行任何语句。

# 用 if 条件语句比较两个数的大小
# 使用 read 内建命令提示输入变量值 a 和 b 以回车切换第二次输入。
# * (()) 是一种数学计算命令，它除了可以进行最基本的加减乘除，还可以进行大于、小于、等于等关系运算，以及与、或、非等逻辑运算。
read a
read b
if(($a == $b))
then 
  echo "a和b相等"
fi

# 逻辑运算
# * && 就是逻辑“与”运算符，只有当 && 两侧的判断条件都为“真”时，整个判断条件才为“真”。
read age
read iq
if(( $age > 18 && $iq < 60 ))
then
  echo "都成年了，智商还不及格"
  echo "言尽于此"
fi

# if else 语句
# 如果有两个分支，可以使用 if else语句
# 语法：
#   if condition
#   then
#     statement1
#   else
#     statement2
#   fi
# 语法释义：如果 condition 成立，那么 then 后边的 statement1 语句将会被执行；否则执行 else 后边的 statement2 语句。
read c
read d
if(( $c == $d ))
then
  echo " c 和 d 相等"
else
  echo " c 和 d 不相等"
fi

# if elif else 语句
# 如果条件是任意数目的分支，当分支比较多是，可以使用 if elif else 结构语句
# 语法:
#   if condition1
#   then
#     statement1
#   elif condition2
#   then
#     statement2
#   elif condition3
#   then
#     statement3
#   ……
#   else
#     statementn
#   fi
# 语法释义：如果 condition1 成立就执行 if 后边的 statement1 ；如果 condition1 不成立，那么继续执行 elif 和 statement ，依次类推，如果 if 和 elif 都不成立，就进入最后的 else 执行 statementn 。
# 语法注意： if 和 elif 后边都得跟着 then。
read age2
if (( $age2 <= 2 )); then
  echo "年龄小于等于 2 的婴儿"
elif (( $age2 >= 3 && $age2 <= 8 )); then
  echo "年龄大于等于 3 ，小于等于 8 的幼儿"
elif (( $age2 >= 9 && $age2 <= 17 )); then
  echo "年龄大于等于 9 ，小于等于 17 的少年"
elif (( $age2 >= 18 && $age2 <= 25 )); then
  echo "年龄大于等于 18 ，小于等于 25 的成年"
elif (( $age2 >= 26 && $age2 <= 40 )); then
  echo "年龄大于等于 26 ，小于等于 40 的青年"
elif (( $age2 >= 41 && $age2 <= 60 )); then
  echo "年龄大于等于 41 ，小于等于 60 的中年"
else
  echo "大于等于 61 的老年"
fi

