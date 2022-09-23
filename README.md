# チェリー本 第二版

+ [サンプルコード](https://github.com/Junichiito/ruby-book-codes-v2) <br>

+ [正誤表](https://ruby-book.jnito.com/) <br>

+ [Ruby 公式リファレンス](https://docs.ruby-lang.org/ja/) <br>

+ [Ruby String](https://docs.ruby-lang.org/ja/latest/class/String.html) <br>

+ [Rubyの公式リファレンスが読めるようになる本](https://zenn.dev/jnchito/books/how-to-read-ruby-reference) <br>

## `2.3.2` 文字列の比較

+ p31　チェック<br>

# 2.6 メソッドの定義 p42〜

## 2.6.2 メソッド定義における引数の() p44

# 2.7 例題 : FizzBuzz プログラムを作成する

+ `$ mkdir ruby-book && mkdir $_/lib && touch $_/fizz_buzz.rb`を実行<br>

+ `ruby-book/lib/fizz_buzz.rb`を編集<br>

```rb:fizz_buzz.rb
puts 'Hello, world!'
```

+ `$ ruby ruby-book/lib/fizz_buzz.rb`を実行<br>

```:terminal
Hello, world!
```

## 2.7.3 fizz_buzzメソッドを作成する p45

+ 3で割り切れる数値を引数に渡すと、"Fizz"を返す。<br>

+ 5で割り切れる数値を引数に渡すと、"Buzz"を返す。<br>

+ 15で割り切れる数値を引数に渡すと、"Fizz Buzz"を返す。<br>

+ それ以外の数値はその数値を文字列に変えて返す。<br>

+ `fizz_buzzメソッドの実行例は下記のようになる。<br>

```
fizz_buzz(1) #=> "1"
fizz_buzz(2) #=> "2"
fizz_buzz(3) #=> "Fizz"
fizz_buzz(4) #=> "4"
fizz_buzz(5) #=> "Buzz"
fizz_buzz(6) #=> "Fizz"
fizz_buzz(15) #=> "Fizz Buzz"
```

+ `ruby-book/lib/fizz_buzz.rb`を編集<br>

```rb:fizz_buzz.rb
def fizz_buzz(n)
  n.to_s
end

puts fizz_buzz(1)
puts fizz_buzz(2)
```

+ `$ ruby ruby-book/lib/fizz_buzz.rb`を実行<br>

```
def fizz_buzz(n)
  n.to_s
end

puts fizz_buzz(1)
puts fizz_buzz(2)
```

```:terminal
1
2
```

+ `ruby-book/lib/fizz_buzz.rb`を編集<br>

```rb:fizz_buzz.rb
def fizz_buzz(n)
  if n % 3 == 0
    'Fizz'
  else
    n.to_s
  end
end

puts fizz_buzz(1)
puts fizz_buzz(2)
puts fizz_buzz(3)
```

```:terminal
1
2
Fizz
```

+ `ruby-book/lib/fizz_buzz.rb`を編集<br>

```rb:fizz_buzz.rb
def fizz_buzz(n)
  if n % 3 == 0
    'Fizz'
  elsif n % 5 == 0
    'Buzz'
  else
    n.to_s
  end
end

puts fizz_buzz(1)
puts fizz_buzz(2)
puts fizz_buzz(3)
puts fizz_buzz(4)
puts fizz_buzz(5)
puts fizz_buzz(6)
```

```:terminal
1
2
Fizz
4
Buzz
Fizz
```

+ `ruby-book/lib/fizz_buzz.rb`を編集<br>

```rb:fizz_buzz.rb
def fizz_buzz(n)
  if n % 15 == 0
    'Fizz Buzz'
  elsif n % 3 == 0
    'Fizz'
  elsif n % 5 == 0
    'Buzz'
  else
    n.to_s
  end
end

puts fizz_buzz(1)
puts fizz_buzz(2)
puts fizz_buzz(3)
puts fizz_buzz(4)
puts fizz_buzz(5)
puts fizz_buzz(6)
puts fizz_buzz(15)
```

```:terminal
groovy@groovy-no-MacBook-Pro lib % ruby fizz_buzz.rb
1
2
Fizz
4
Buzz
Fizz
Fizz Buzz
```

# 2.8 文字列についてもっと詳しく p50〜

## 2.8.1 文字列はStringクラスのオブジェクト

```
'abc'.class #=> String
```

```rb:sample.rb
# %q! !はシングルクオートで囲んだことと同じになる
puts %q!He said, "Don't speak."! #=> He said, "Don't speak."

# %Q! !はダブルクオートで囲んだことと同じになる（改行文字や式典かいが使える）
something = "Hello."
puts %Q!He said, "#{something}"! #=> He said, "Hello."

# %! !もダブルクオートで囲んだことと同じになる
something = "Bye."
puts %!He said, "#{something}"! #=> He said, "Bye."
```

```rb:sample.rb
# ?を区切り文字として使う
puts %q?He said, "Don't speak"? #=> He said, "Don't speak"

# { }を区切り文字として使う
puts %q{He said, "Dont't speak."} #=> He said, "Dont't speak."
```

# 2.8.3 ヒアドキュメント（行至高文字列リテラル）p51

+ 文字列は開業することもできます。<br>

```rb:sample.rb
puts "Line 1,
Line 2"
#=> Line 1,
#   Line 2

puts 'Line 1,
Line 2'
#=> Line 1,
#   Line 2
```

+ ヒアドキュメント

```
<<識別子
1行目
2行目
3行目
識別子
```

```rb:sample.rb
a = <<TEXT # 識別子
これはヒアドキュメントです。
複数行にわたる長い文字列を作成するに便利です。
TEXT
puts a
#=> これはヒアドキュメントです。
#   複数行にわたる長い文字列を作成するに便利です。
```

```rb:sample.rb
# ヒアドキュメントの識別子としてHTMLを使う場合
a = <<HTML
<div>
  <img src="sample.jpg">
</div>
HTML
puts a
# => <div>
#      <img src="sample.jpg">
#    </div>
```

+ `<<-TEXTのように - を入れると、最後の識別子をインデントさせることができる`<br>

```rb:sample.rb
def some_method
  <<-TEXT
これはヒアドキュメントです。
<<-を使うと最後の識別子をインデントさせることができます。
  TEXT
end

puts some_method
#=> これはヒアドキュメントです。
#   <<-を使うと最後の識別子をインデントさせることができます。
```

```rb:sample.rb
def some_method
  <<~TEXT
    これはヒアドキュメントです。
    <<~を使うと内部文字列のインデント部分が無視されます。
  TEXT
end

puts some_method

#=> これはヒアドキュメントです。
#   <<~を使うと内部文字列のインデント部分が無視されます。
```

```rb:sample.rb
def some_method
  <<~TEXT
    \  各行の行頭に半角スペースを2文字入れます。
    \  この時行頭はバックスラッシュで指定します。
  TEXT
end

puts some_method
# =>  各行の行頭に半角スペースを2文字入れます。
#     この時行頭はバックスラッシュで指定します。
```

```rb:sample.rb
name = 'Alice'
a = <<TEXT
ようこそ、#{name}さん!
以下のメッセージをご覧ください。
TEXT
puts a
#=> ようこそ、Aliceさん!
#   以下のメッセージをご覧ください。
```

```rb:sample.rb
# <<'TEXT'のように、識別子をシングルクオートで囲むと式展開が無効になる
name = 'Alice'
a = <<'TEXT'
ようこそ、#{name}さん！
以下のメッセージをご覧ください。
TEXT
puts a
#=> ようこそ、#{name}さん！
#   以下のメッセージをご覧ください。
```

```rb:sample.rb
# デフォルトは改行文字が有効
a = <<TEXT
こんにちは\nさようなら
TEXT
puts a
#=> こんにちは
#   さようなら

# 識別子をダブルクオートで囲んだ場合も改行文字が有効
a = <<"TEXT"
こんにちは\nさようなら
TEXT
puts a
#=> こんにちは
#   さようなら

# 識別子をシングルクオートで囲んだ場合は改行文字が無効
a = <<'TEXT'
こんにちは\nさようなら
TEXT
puts a
#=> こんにちは\nさようなら
```

```
開始ラベルの <<識別子 1つの式とみなさられます。
このため、（見た目は少し奇妙ですが） <<識別子 をメソッドの引数として渡したり、 <<識別子 に対してメソッドを呼び出したりできます。
```

```rb:sample.rb
# ヒアドキュメントを直接引数として渡す（prependは渡された文字列を先頭に追加するメソッド)
a = 'Ruby'
a.prepend(<<TEXT
Java
Python
TEXT
)
puts a
#=> Java
#   Python
#   Ruby

# ヒアドキュメントで作成した文字列に対して、直接upcaseメソッドを呼び出す (upcaseは文字列を全て大文字にするメソッド)
b = <<TEXT.upcase
Hello,
Good-bye.
TEXT
puts b
#=> HELLO,
#   GOOD-BYE.

# ヒアドキュメントを2つ同時に使って配列を作る (配列については第4章で詳しく説明します)
c = [<<TEXT1, <<TEXT2]
Alice
Bob
TEXT1
Matz
Jnchito
TEXT2

# 0番目の要素にはTEXT1の内容が入る
puts c[0]
#=> Alice
#   Bob

# 1番目の要素にはTEXT2の内容が入る
puts c[1]
#=> Matz
#   Jnchito
```

## 2.8.4 フォーマットを指定して文字列を作成する p54

```
spintf メソッドを使うと、指定されたフォーマットの文字列を作成することができます。
例えば以下は少数第3位まで数字を表示する文字列を作成するコードです。
```

```rb:sample.rb
sprintf('%0.3f', 1.2)
#=> 1.200
```

```
少し変わった書き方になりますが、"フォーマット文字列 % 表示したいオブジェクト" の形式で書いても同じ効果が得られます。
```

```rb:sample.rb
puts '%0.3f' % 1.2
#=> 1.200
```

```
表示したいオブジェクトを複数渡すこともできます(次のコードに出てくる[1.2, 0.48])は配列です。配列については第4章で説明します)。
```

```rb:sample.rb
sprintf('%0.3f + %0.3f', 1.2, 0.48)
#=> 1.200 + 0.480

'%0.3f + %0.3f' % [1.2, 0.48]
#=> 1.200 + 0.480
```

+ [フォーマット文字列の指定方法](https://docs.ruby-lang.org/ja/latest/doc/print_format.html) <br>
