#!/bin/bash

# 特殊变量及其含义
# $0      当前脚本文件名
# $n(n≥1)	传递给脚本或函数的参数。 n 是一个数字，表示第几个参数。例如，第一个参数是 $1 ，第二个参数是 $2 。
# $#	    传递给脚本或函数的参数个数。
# $*	    传递给脚本或函数的所有参数。
# $@	    传递给脚本或函数的所有参数。当被双引号""包含时， $@ 与 $* 稍有不同。
# $?	    上个命令的退出状态，或函数的返回值。
# $$	    当前 Shell 进程 ID。对于 Shell 脚本，就是这些脚本所在的进程 ID。
echo "当前 shell 进程id值是: $$"       # 执行命令：“sh 4特殊变量.sh parameter1 parameter2”
echo "当前 shell 脚本文件名: $0"
echo "当前 shell 第一个参数: $1"
echo "当前 shell 第二个参数: $2"
echo "当前 shell 的参数个数: $#"
echo "当前 shell 所有的参数【写法一】: $@"
echo "当前 shell 所有的参数【写法二】: $*"

# 给函数传递参数
function fn(){
  echo "当前函数进程id值是: $$"
  echo "当前函数脚本文件名: $0"
  echo "当前函数第一个参数: $1"
  echo "当前函数第二个参数: $2"
  echo "当前函数第三个参数: $3"
  echo "当前函数的参数个数: $#"
  echo "当前函数所有的参数【写法一】: $@"
  echo "当前函数所有的参数【写法二】: $*"
}
fn parameter3 parameter4 parameter5