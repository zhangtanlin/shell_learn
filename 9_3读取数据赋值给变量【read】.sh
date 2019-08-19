#!/bin/bash

# 读取数据并赋值给变量
# 默认从键盘读取用户输入的数据，如果进行了从定向，可以从文件中读取数据。
# 语法： read [-options][variables]
# read 参数支持的选项
# -a array	    把读取的数据赋值给数组 array，从下标 0 开始。
# -d delimiter	用字符串 delimiter 指定读取结束的位置，而不是一个换行符（读取到的数据不包括 delimiter）。
# -e            在获取用户输入的时候，对功能键进行编码转换，不会直接显式功能键对应的字符。
# -n num	      读取 num 个字符，而不是整行字符。
# -p prompt	    显示提示信息，提示内容为 prompt。
# -r            原样读取（Raw mode），不把反斜杠字符解释为转义字符。
# -s            静默模式（Silent mode），不会在屏幕上显示输入的字符。当输入密码和其它确认信息的时候，这是很有必要的。
# -t seconds	  设置超时时间，单位为秒。如果用户没有在指定时间内输入完成，那么 read 将会返回一个非 0 的退出状态，表示读取失败。
# -u fd	        使用文件描述符 fd 作为输入源，而不是标准输入，类似于重定向。

# 验证 read -p 【使用提示语，获取输入内容（输入内容以空格分隔）】
# 注意：以空格区分，后面多余的参数，归结到最后一个参数上。
# 注意：必须在一行内输入所有的值，不能换行，否则只能给第一个变量赋值，后续变量都会赋值失败。
read -p "请输入三个变量并以空格区分>" parameter1 parameter2 parameter3
echo "参数1：$parameter1"
echo "参数2：$parameter2"
echo "参数3：$parameter3"

# 验证 read -n -p 【获取输入的前几个字符】
# 注意： -n 后面的参数表示读取多少个字符
# 注意： printf "\n" 语句用来达到换行的效果，否则 echo 的输出结果会和用户输入的内容位于同一行，不容易区分。
read -n 5 -p "输入参数>" parameter1
printf "\n"
echo $parameter1

# 验证 read -t -s -p 【在静默模式下和有过期时间的前提下，输入数据，验证是否一致】
if
  read -t 20 -sp "请输入密码>" pass1 && printf "\n" &&  #第一次输入密码
  read -t 20 -sp "请确认密码> " pass2 && printf "\n" && #第二次输入密码
  [ $pass1 == $pass2 ]                                 #判断两次输入的密码是否相等
then
  echo "两次密码输入一致"
else
  echo "两次密码不一致"
fi
