#!/bin/sh

ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error"

# テスト1 正常動作の確認
echo '最大公約数は2です' > ${ans}
./report5.sh 2 4 > ${result}
diff ${ans} ${result} || echo "error in 1-1" >> ${err}

echo '最大公約数は14です' > ${ans}
./report5.sh 42 28 > ${result}
diff ${ans} ${result} || echo "error in 1-2" >> ${err}

echo '最大公約数は61です' > ${ans}
./report5.sh 2379 3355 > ${result}
diff ${ans} ${result} || echo "error in 1-3" >> ${err}

echo '最大公約数はありません' > ${ans}
./report5.sh 5 3 > ${result}
diff ${ans} ${result} || echo "error in 1-4" >> ${err}

# テスト2 引数の数が2つ以外の動作
echo '入力する引数は２つです' > ${ans}
./report5.sh 3 > ${result}
diff ${ans} ${result} || echo "error in 2-1" >> ${err}

echo '入力する引数は２つです' > ${ans}
./report5.sh > ${result}
diff ${ans} ${result} || echo "error in 2-2" >> ${err}

echo '入力する引数は２つです' > ${ans}
./report5.sh 1 2 3 > ${result}
diff ${ans} ${result} || echo "error in 2-3" >> ${err}

# テスト3 引数の値が不正時の動作
echo '自然数を入力してください' > ${ans}
./report5.sh aaa bbb > ${result}
diff ${ans} ${result} || echo "error in 3-1" >> ${err}

echo '自然数を入力してください' > ${ans}
./report5.sh 0 5 > ${result}
diff ${ans} ${result} || echo "error in 3-2" >> ${err}

echo '自然数を入力してください' > ${ans}
./report5.sh 3 aaa > ${result}
diff ${ans} ${result} || echo "error in 3-3" >> ${err}

if [ -f ${err} ]; then
    cat ${err}
    rm /tmp/$$-*
    exit 1
fi
