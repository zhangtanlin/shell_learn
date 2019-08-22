#!/bin/bash

# 条件语句 case in
# 当分支较多，并且判断条件比较简单时，使用 case in 语句比较方便。
# 语法： 
# case expression in
#   pattern1)
#     statement1
#     ;;
#   pattern2)
#     statement2
#     ;;
#   ……
#   *)
#     statement
# esac
# 语法释义1： case 、 in 、 esac 都是 Shell 关键字， expression 表示表达式， pattern 表示匹配模式。
# 语法释义2： expression 可以是一个变量、一个数字、一个字符串，还可以是一个数学计算表达式，或者是命令的执行结果，只要能够得到 expression 的值就可以。
# 语法释义3： pattern 可以是一个数字、一个字符串，甚至是一个简单的正则表达式。
# 语法释义4： case 会将 expression 的值与 pattern 每个值逐个匹配，如果匹配成功，就会执行这个模式后面对应的所有语句（该语句可以有一条，也可以有多条），直到遇到双分号“;;”才停止。【此时 case 语句执行完了，程序会跳出整个 case语句，执行 esac 后面的其他语句 】。
# 语法释义5： 如果 expression 没有匹配到 pattern 的值，那么就执行 *) 后面的语句【 * 表示其他所有值】，直到遇见双分号 ;; 或者 esac 才结束。【 *) 相当于多个 if 分支语句中最后的 else 部分】
# 注意1：语句里面的“;;”和“*)”就相当于其它编程语言中的 break 和 default 。
# 注意2：语句里可以没有“*)”部分。如果 expression 没有匹配到任何一个模式，那么就不执行任何操作。
注意3：除了最后一个分支外【这个分支可以使普通分支】

# 示例：根据输入的数值、字符串判定是星期几
# 注意：用法中的“;;”。
printf "请输入数值:"
read parameter
case $parameter in
  1)
    echo "星期一"
    ;;
  2)
    echo "星期二"
    ;;
  3)
    echo "星期三"
    ;;
  4)
    echo "星期四"
    ;;
  5)
    echo "星期五"
    ;;
  6)
    echo "星期六"
    ;;
  7)
    echo "星期日"
    ;;
  *)
    echo "输入错误，请输入数值1-7"
esac