#!/bin/sh

# 引数のチェック。
if [ $# -ne 2 ]; then
  echo '入力する引数は２つです'
  exit 1
else
  # 整数チェック
  expr $1 + $2 > /dev/null 2>&1
  if [ $? -ge 2 ]; then
	  echo '自然数を入力してください'
	  exit 1
  fi

  if [ $1 -eq 0 -o $2 -eq 0 ]; then
    echo '自然数を入力してください'
	  exit 1
  fi
fi

arg1=$1
arg2=$2
# 第一引数 < 第二引数の時入れ替え
if [ $arg1 -lt $arg2 ]; then
  tmp=$arg1
  arg1=$arg2
  arg2=$tmp
fi

# 最大公約数計算
var=$(( $arg1 % $arg2 ))
while [ $var -gt 1 ]
do
	var=$(( $arg1 % $arg2 ))
	arg1=$arg2
  if [ $var -gt 1 ]; then
    arg2=$var
  fi
done

if [ $var -eq 0 ];then
	echo "最大公約数は${arg2}です"
else
	echo '最大公約数はありません'
fi
