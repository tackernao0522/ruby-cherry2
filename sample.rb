# ヒアドキュメントを直接引数として渡す（prependは渡された文字列を先頭に追加するメソッド)
a = 'Ruby'
a.prepend(<<TEXT
Java
Python
TEXT
)
puts a

# ヒアドキュメントで作成した文字列に対して、直接upcaseメソッドを呼び出す (upcaseは文字列を全て大文字にするメソッド)
b = <<TEXT.upcase
Hello,
Good-bye.
TEXT
puts b

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

# 1番目の要素にはTEXT2の内容が入る
puts c[1]

puts sprintf('%0.3f', 1.2)

puts '%0.3f' % 1.2

puts sprintf('%0.3f + %0.3f', 1.2, 0.48)

puts '%0.3f + %0.3f' % [1.2, 0.48]