#!/bin/bash

#变量
#*赋值号=的周围不能有空格;
#*加花括号是为了帮助解释器识别变量的边界;
#*推荐：给所有变量加上花括号{}。
name="hello"
echo $name
echo ${name}

#变量修改
#*已定义的变量，可以被重新赋值;
#*第二次对变量赋值时不能在变量名前加$，只有在使用变量时才能加$。
name="changename"
echo ${name}

#单引号、双引号的区别
#*单引号内全是字符串【即使有变量和命令（命令需要反引起来）】；
#*双引号内在输出时会先解析里面的变量和命令。
#*建议：变量的内容是数字可以不加引号；
#*      如果真的需要原样输出就加单引号；
#*      其他没有特别要求的字符串等最好都加上双引号，
#*      定义变量时加双引号是最常见的使用场景。
url="www.juguozhonglin.ltd/"
url1='我正在学习shell：${url}'
url2="我也正在学习shell：${url}"
echo ${url1}
echo ${url2}

#命令的结果赋值给变量
#*type1方式把命令用反引号` `（位于 Esc 键的下方）包围起来；
#*type2方式把命令用$()包围起来。
#*建议：type2区分明显，推荐使用这种方式。
type1=`command`
type2=$(command)
#示例：
#[mozhiyan@localhost ~]$ cd demo
#[mozhiyan@localhost demo]$ log=$(cat log.txt)
#[mozhiyan@localhost demo]$ echo ${log}
#[mozhiyan@localhost demo]$ log=`cat log.txt`
#[mozhiyan@localhost demo]$ echo ${log}

#只读命令
#*使用 readonly 命令可以将变量定义为只读变量，只读变量的值不能被改变。
target="www.juguozhonglin.ltd/"
echo ${target}
readonly target
#target="www.juguozhonglin222222.ltd/" #这行会报错，不能再次给target赋值

#删除变量
#*使用 unset 可以删除变量;
#*不能删除只读变量
unset name
unset url
unset url1
unset url2
unset type1
unset type2
unset target
