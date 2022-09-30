## 2.10.4 case文 p64〜

１つのオブジェクトや式を複数の値と比較する場合は、elsifを重ねるよりも case文で書いた方がシンプルになります。<br>
case文の構文は次のとおりです。<br>

```rb:sample.rb
case 対象のオブジェクトや式
  when 値1
    # 値1に一致する場合の処理
  when 値2
    # (値1に一致せず) 値2に一致する場合の処理
  when 値3
    # (値1にも値2にも一致せず) 値3に一致する場合の処理
  else
    # どれにも一致しない場合の処理
  end
```

たとえば「2.5.3 if文」の説明で使ったサンプルコードをcase文に書き直すと次のようになります。p64<br>

```rb:sample.rb
country = 'italy'

# if文を使う場合
if country == 'japan'
  'こんにちは'
elsif country == 'us'
  'Hello'
elsif country == 'italy'
  'Ciao'
else
  '???'
end
#=> "Ciao"

# case文を使う場合
case country
when 'japan'
  'こんにちは'
when 'us'
  'Hello'
when 'italy'
  'Ciao'
else
  '???'
end
#=> "Ciao"
```

構文としてはC言語やJavaScriptの switch文に似ていますが、switch文と違って break のようなキーワードを用いなくても、<br>
次のwhen節の処理が実行されたりすることはありません。<br>
以下にJavaScriptのswitch文とRubyのcase文の比較を載せておきます。<br>

+ JavaScriptのswitch文<br>

```js:sample.js
// JavaScriptのswitch文。breakを書き忘れると、その次のcase節の処理も実行されてしまう（フォールスルー）
const country = 'italy'

switch (country) {
  case 'japan':
    console.log('こんにちは')
    break
  case 'us':
    console.log('Hello')
    // フォールスルーさせるため、わざとコメントアウト
    // break
  case 'italy':
    console.log('Ciao')
    break
  default:
    console.log('???')
}
// => Hello
// Ciao
```

+ Rubyのcase文<br>

```rb:sample.rb
country = 'us'

# Rubyのcase文は勝手にその次のwhen節の処理が実行されたりすることはない
case country
when 'japan'
  'こんにちは'
when 'us'
  'Hello'
when 'italy'
  'Ciao'
else
  '???'
end
#=> "Hello"
```

Ruby の case文ではwhen節に複数の値を指定し、どれかに一致すれば処理を実行する、という条件分岐を書くことができます。<br>

```rb:sample.rb
# when節に複数の値を指定する
country = 'アメリカ'
case country
when 'japan', '日本'
  'こんにちは'
when 'us', 'アメリカ'
  'Hello'
when 'italy', 'イタリア'
  'Ciao'
else
  'Ciao'
end
#=> "Hello"
```

case節の式を省略すると、条件式が最初に真になるwhen節の処理が実行されます。<br>

```rb:sample.rb
country = 'italy'

# case節の式を省略し、when節の条件式を順に評価するcase文
case
when country == 'japan'
  'こんにちは'
when country == 'us'
  'Hello'
when country == 'italy'
  'Ciao'
else
  '???'
end
#=> "Ciao"
```

とはいえ、上のようなcase文は if/elsif を使った条件分岐を大差がないため、わざわざ使うメリットは薄いと思います。<br>

if文と同様、case文も最後に評価された式を戻り値として返すため、case文の結果を変数に入れることが可能です。<br>

```rb:sample.rb
country = 'italy'

message =
  case country
  when 'japan'
    'こんにちは'
  when 'us'
    'Hello'
  when 'italy'
    'Ciao'
  else
    '???'
  end

mesage #=> "Ciao"
```

when節の後ろにはthenを入れることができます。thenを入れると次のようにwhen節とその条件が真だった場合の処理を1行で書くことができますが、使用頻度はそれほど高くありません。<br>

```rb:sample.rb
country = 'italy'

case country
when 'japan' then 'こんにちは'
when 'us' then 'Hello'
when 'italy' then 'Ciao'
else '???'
end
#=> "Ciao"
```

他にも whenに渡す値として、範囲 (Range) オブジェクトや正規表現オブジェクト、クラスオブジェクトなどを使うこともできます。<br>
範囲オブジェクトについては第4章で、正規表現オブジェクトについては第6章で、クラスオブジェクトについては第7章でそれぞれ説明します。<br>

ところで、Ruby2.7からはcase文に一見よく似た「パターンマッチ」が導入されました。<br>
パターンマッチでは case/when ではなく case/in を使う点が構文上の違いです。<br>
しかし、公文だけでなく機能面でもcase文とパターンマッチは大きな違いがあります。パターンマッチについては第11章で詳しく説明します。<br>

```rb:sample.rb
# パターンマッチのコード例。case文によく似ているがwhenではなくinを使っている点に注目。詳しくは第11章を参照
case [0, 1, 2]
in [n, 1, 2]
  "n=#{n}"
else
  'not matched'
end
#=> "n=0"
```

## 2.10.5 条件演算子 (三項演算子) p67

RubyではC言語と同じような ? : を使った条件分岐 (三項演算子) を使うことができます。<br>

`式 ? 真だった場合の処理 : 偽だった場合の処理`<br>

たとえば、「2.5.3 if文」の説明で次のようなコード例を使いました。<br>

```rb:sample.rb
n = 11
if n > 10
  '10より大きい'
else
  '10以下'
end
#=> "10より大きい"
```

このコードは条件演算子を使うと次のように書き直すことができます。<br>

```rb:sample.rb
n = 11
n > 10 ? '10より大きい' : '10以下'
#=> "10より大きい"
```

次のように、条件分岐した結果を変数に代入することも可能です。<br>

```rb:sample.rb
n = 11
message = n > 10 ? '10より大きい' : '10以下'
message #=> "10より大きい"
```

シンプルな if/else文であれば、条件演算子を使ったほうがすっきり書ける場合があります。<br>
逆に複雑な条件文だったりすると、かえって読みづらくなる場合もあるので、コードの可読性を考慮しながら利用するようにしてください。<br>
