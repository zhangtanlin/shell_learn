#!/bin/bash

# 创建别名
# 在命令行中运行 alias 可以查看当前Shell进程中使用了那些别名【但是在 sh 文件中没查询成功】。
# 语法： alias new_name="command"
# 注意：在代码中使用 alias 命令定义的别名只能在当前 Shell 进程中使用，在子进程和其它进程中都不能使用。当前 Shell 进程结束后，别名也随之消失。
# 要想让别名对所有的 Shell 进程都有效，就得把别名写入 Shell 配置文件。
alias            # 查询创建了哪些别名
alias ll="ls -l" # 给命令 “ls -l” 创建别名 “ll”
alias            # 查询创建了哪些别名，输出： ll="ls -l"

# 给 关机命令“shutdown -h now” 创建别名
alias my_shutdown="shutdown -h -now"
alias

# 给当前 unix 时间戳创建别名 timeUNIX
# alias timeUNIX="date +%s"
# alias
# echo "当前时间戳的值为：$timeUNIX" # 输出当前时间的 UNIX 时间戳

alias timeUNIX='date +%s'
sleep 1s                 # 一秒后执行
timeNowUNIX=$(timeUNIX) # $() 表示明令替换的，和 timeNowUNIX=`timestamp` 等价
echo "当前时间戳的值为: ${timeNowUNIX}"

# 删除别名
# 使用 unalias 内建命令可以删除当前 Shell 进程中的别名。
# 语法： usalias new_name
# 注意： unalias -a 表示删除进程中的所有的别名
unalias timeUNIX
alias
unalias -a
alias
