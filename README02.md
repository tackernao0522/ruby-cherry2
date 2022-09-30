## 2.8.5 その他、文字列作成のいろいろ p55〜

```rb:sample.rb
# 数値を文字列にする
123.to_s #=> "123"

# 配列の各要素を連結して１つの文字列にする
[10, 20, 30].join #=> "102030"

# *演算子を使って文字列を繰り返す
'Hi!' * 10 #=> "Hi!Hi!Hi!Hi!Hi!Hi!Hi!Hi!Hi!Hi!"

# String.newを使って新しい文字列を作る(あまり使わない)
String.new('hello') #=> "hello"
```

```rb:sample.rb
# 以下は 'abcdef' と書いたのと同じ (滅多に使わない)
'abc' 'def'
#=> "abcdef"

# スペースがなくても可（こちらも滅多に使わない）
'abc''def'
#=> "abcdef"
```

```rb:sample.rb
# また、ダブルクオートと \uを組み合わせてUnicodeのコードポイントから文字列を作成することも可能です。
"\u3402\u3044\u3046"
#=> "あいう"
```

# 2.9 数値についてもっと詳しく p56〜


## 2.9.1 基数指示子を用いた整数リテラル

+ 2進数の場合は 0b、8進数の場合は 0 または0o、16進数の場合は 0x という基数指示子を先頭につけると、それぞれ10進法以外の記数法で整数値を書くことができます。<br>

```rb:sample.rb
# 2進数
0b11111111 #=> 255

# 8進数
0377 #=> 255
0o377 #=> 255

# 16進数
0xff #=> 255

# 10進数 (0dをつけなくても同じなので、普通はつけない)
0d255 #=> 255
```

## 2.9.2 ビット演算

+ 整数値は次の演算子を使ってビット演算（整数値の2進表現に対応したビット例に関する演算）ができます。<br>

+ & : ビットごとの論理積(AND)<br>

+ | : ビットごとの論理和(OR)<br>

+ ^ : ビットごとの排他的論理和(XOR)<br>

+ >> : 右ビットシフト<br>

+ >> : 左ビットシフト<br>

+ ~ : ビットごとの論理反転(NOT)<br>

以下はビット演算子の使用例です。演算結果は「2.8.4 フォーマットを指定して文字列を作成する」の項で説明した sprintf メソッドを使って2進数表示しています。<br>

```rb:sample.rb
sprintf '%#b', (0b1010 & 0b1100) #=> "0b1000"
sprintf '%#b', (0b1010 | 0b1100) #=> "0b1110"
sprintf '%#b', (0b1010 ^ 0b1100) #=> "0b110"
sprintf '%#b', (0b1010 >> 1) #=> "0b101"
sprintf '%#b', (0b1010 << 1) #=> "0b10100"
sprintf '%#b', ~0b1010 #=> "0b..10101" ..1 は左側に1が無限に続くことを表す
```

## 2.9.3 指数表現

Rubyでは指数表現を使って浮動小数点数を表すことができます。次の 2e-3 は「2 x 10^3」で0.002の意味になります。<br>

```rb:sample.rb
2e-3 #=> 0.002
```

## 2.9.4 数値クラスのあれこれ

数値関連のクラスにはいくつか種類があります。例えば整数であれば Integerクラス、少数であれば Floatクラスになります。

```rb:sample.rb
10.class #=> Integer
1.5.class #=> Float
```

この他にも有理数を表すRationalクラスや、複素数を表すComplexクラスがあります。<br>

```rb:sample.rb
# 有理数リテラルを使う（3rが有理数リテラル）
r = 2 / 3r
r       #=> (2/3)
r.class #=> Rational

# 文字列から有理数に変換する
r = '2/3'.to_r
r       #=> (2/3)
r.class #=> Rational

# 複素数リテラルを使う (0.5iが複素数リテラル)
c = 0.3 - 0.5i
c       #=> (0.3-0.5i)
c.class #=> Complex

# 文字列から複素数に変換する
c = '0.3-0.5i'.to_c
c       #=> (0.3-0.5i)
c.class #=> Complex
```

ここで説明した数値クラスは全てNumericクラスのサブクラスです。<br>
各クラスの継承関係は 図2-2(p58)を参照してください。なお、継承については「7.6 クラスの継承」の節で詳しく説明します。<br>

# 2.10 真偽値と条件分岐についてもっと詳しく p58〜

## 2.10.1 && や || の戻り値と評価を終了するタイミング

&& や || を使った場合、式全体の戻り値は必ずしも true または falseになるとは限りません。<br>
例えば次の結果を見てください。<br>

```rb:sample.rb
1 && 2 && 3 #=> 3
1 && nil && 3 #=> nil
1 && false && 3 #=> false

nil || false #=> false
false || nil #=> nil
nil || false || 2 || 3 #=> 2
```

Rubyではif文以外のところで&&や||を意図的に使う場合があります。<br>
以下は || を使った式の戻り値や、真偽値が確定した時点で評価が終了されることを活用した架空のコード例です。<br>

```rb:sample.rb
# Alice、Bob、Carolと順に検索し、最初に見つかったユーザ（nilまたはfalse以外の値）を変数に格納する
user = find_user('Alice') || find_user('Bob') || find_user('Carol')

# 正常なユーザーであればメールを送信する（左辺が偽であればメールは送信されない）
user.valid? && send_email_to(user)
```

## 2.10.2 優先順位が低い　and、or、not

&&、||、! に近い働きをする演算子として and、or、 notがあります。<br>

```rb:sample.rb
t1 = true
f1 = false
t1 and f1 #=> false
t1 or f1  #=> true
not t1    # false
```

### 優先度

|優先順位|記号|
|:---:|:---:|
|1|!|
|2|&&|
|3||||
|4|not|
|5|and, or(優先順位は同じで違いはない)|

例えば、英語の論理演算子と記号の論理演算子を混在させたりすると結果が異なる場合があります。<br>

```rb:sample.rb
t1 = true
f1 = false
!f1 || t1    #=> true
not f1 || t1 #=> false
```

これはそれぞれ次のような式を書いたことと同じになるためです。<br> p60〜

```rb:sample.rb
# !は||よりも優先順位が高い
!(f1) || t1
# notは||よりも優先順位が低い
not(f1 || t1)
```

また、&&、|| と異なり、and と or は優先順位に違いがありません。<br>
そのため( )を使わない場合は左から右に順番に真偽値が評価されていきます。<br>
例えば、次のようなコードを書くと結果が異なります。<br>

```rb:sample.rb
t1 = true
t2 = true
f1 = false

t1 || t2 && f1  #=> true && が || よりも優先されるので t2 && f1 を先に判断され t1 || f1 が最後に判断される
t1 or t2 and f1 #=> false and と orは優先順位に違いがない
```

これは次のような式を書いたことと同じになるためです。<br>

```rb:sample.rb
# && は || よりも優先順位が高い
t1 || (t2 && f1)
# and と or の優先順位は同じなので、左から順に評価される
(t1 or t2) and f1
```

このような特徴があるため、and や or を && や || の代わりに使おうとすると思いがけない不具合を招く可能性があります。<br>
and や or は条件分岐で使うのではなく、制御フローを扱うのに向いています。<br>
たとえば次のコードは前項で使った「正常なユーザーであれば、そのユーザーにメールを送信する」という架空のコードからメソッド呼び出しの丸括弧をなくしたものです。<br>
ただし、このままだと構文エラーが発生します。<br>

```rb:sample.rb
user.valid? && send_mai_to user
```

```:result
 syntax error, unexpected local variable or method, expecting `do' or '{' or '(' (SyntaxError)
...ser.valid? && send_mail_to user
...                           ^~~~
```

これは次のように解釈されてしまったためです。<br>

```rb:sample.rb
(user.valid? && send_mail_to) user
```

しかし、&& の代わりに and を使うと構文エラーにならず、「正常なユーザーであれば、そのユーザーにメールを送信する」という制御フローを実行できます。<br>

```rb:sample.rb
user.valid? and send_mail_to user
```

and を使うと次のように解釈されるためです。<br>

```rb:sample.rb
(user.valid?) and (send_email_to user)
```

ただし、&& を使う場合でも `send_mai_to(user)` と書けば１つの処理であることが明確になるため、構文エラーになりません。<br>

```rb:sample.rb
user.valid? && send_mail_to(user)
```

or も 「Aが真か？ 真でなければBせよ」という制御フローを実現する際に便利です。次はそのコード例です。<br>

```rb:sample.rb
def greet(country)
  # countryがnil (またはfalse) ならメッセージを返してメソッドを抜ける
  country or return 'countryを入力してください'

  if country == 'japan'
    'こんにちは'
  else
    'Hello'
  end
end

greet(nil)      #=> "countryを入力してください"
greet('japan')  #=> "こんにちは"
```

## 2.10.3 unless文 p61〜

Rubyには if と反対の意味を持つ unless があります。<br>
何が反対なのかというと、条件式が偽の場合だけ処理を実行する点です。<br>
if文で否定の条件を書いているときは、unless文に書き換えられます。<br>
たとえば次のようなコードがあったとします。<br>

```rb:sample.rb
status = 'error'
if status != 'ok'
  '何か異常があります'
end
#=> "何か異常があります"
```

これは unless を使って次のように書き換えることができます。<br>

```rb:sample.rb
status = 'error'
unless status == 'ok'
  '何か異常があります'
end
#=> "何か異常があります"
```

else を使って条件が偽でなかった場合（つまり真だった場合）の処理を書くこともできます。<br>

```rb:sample.rb
status = 'ok'
unless status == 'ok'
  '何か異常があります'
else
  '正常です'
end
#=> "正常です"
```

ただし、if文のelsifに相当するもの(elsunlessのような条件分岐)は存在しません。<br>

unlessは if と同様、unlessの戻り値を直接変数に代入したり、修飾子として文の後ろに置いたりできます。<br>

```rb:sample.rb
status = 'error'

# unlessの結果を変数に代入する
message =
  unless status == 'ok'
    '何か異常があります'
  else
    '正常です'
  end

message #=> "何か異常があります"

# unlessを修飾子として使う
'何か異常があります' unless status == 'ok'
#=> '何か異常があります'
```

thenを入れることができる点もif文と同じです。<br>

```rb:sample.rb
status = 'error'
unless status == 'ok' then
  '何か異常があります'
end
#=> "何か異常があります"
```

if + 否定条件は、unless + 肯定条件に書き直すことができるものの、必ず書き直さなければいけないわけではありません。<br>
if文の方が読みやすいと思った場合は、 if + 否定条件のままにしておいても大丈夫です。<br>

```rb:sample.rb
status = 'error'

# unlessを無理に使わなくても良い
if status != 'ok'
  '何か異常があります'
end
#=> "何か異常があります"
```

### `Column` == true や == false は冗長なので書かない p62〜

if文の条件節で「真であること（もしくは偽であること）を判断するために、== trueや == falseと書く人がいますが、これは冗長なのでやめましょう。<br>
以下は == true や == falseを使う書き方から使わない書き方に変更するコード例です。<br>

```rb:sample.rb
s = ''

# (empty? は文字列が空文字だったときにtrueを返し、それ以外はfalseを返すメソッド)
# こうではなく...
if s.empty? == true
  '空文字です'
end

# こう書く
if s.empty?
  '空文字です'
end

n = 123

# (zero? は数値が0だったときにtrueを返し、それ以外はfalseを返すメソッド)
# こうではなく...
if n.zero? == false
  'ゼロではありません'
end

# こう書く
if !n.zero?
  'ゼロではありません'
end
```

同じ考え方で、Rubyではnilを偽として扱うので == nil や != nilを書くこともあまりありません。<br>
ただし、「対象データが未存在である」ということを明示するために、( == nil ではなく) nil?メソッドが使われることはあります(nil?メソッドはオブジェクトがnilだった場合にtrueを返すメソッド)。

```rb:sample.rb
user = nil

# こうではなく・・・・
if user == nil
  'nilです'
end

# こう書く (unless userでも可)
if !user
  'nilです'
end

# またはnil?メソッドを使う
if user.nil?
  'nilです'
end
```

なお、非常にまれなケースですが、「trueそのもの、もしくはfalseそのものであることを判定したい」というケースでは == true や == falseと書く必要があります。<br>

```rb:sample.rb
some_value = true

# 1 や 'ok'ではなく、trueであるかどうかを判定したい
if some_value == true
  'trueそのものです'
end
```
