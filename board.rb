class Board
  #les lignes du tableau qui sont modifiable.
   attr_accessor :b, :e, :h, :a_1, :a_2, :a_3, :b1, :b2, :b3, :c1, :c2, :c3
  #les lignes du tableau qui ne sont pas modifiables.
   attr_reader :o, :a, :c, :d, :f, :g, :i

 #initialisation du board, on lui attribue 9 variables dans des compartiments.
  def initialize(a_1, a_2, a_3, b_1, b_2, b_3, c_1, c_2, c_3)
    @a_1 = a_1
    @a_2 = a_2
    @a_3 = a_3
    @b_1 = b_1
    @b_2 = b_2
    @b_3 = b_3
    @c_1 = c_1
    @c_2 = c_2
    @c_3 = c_3

 #on insere les variables qui seront modifiables dans les compartiments.
    @o = "          1   2   3   "
    @a = "            |   |     "
    @b = "      a   " + @a_1 +" | "+ @a_2 +" | " + @a_3
    @c = "         ___|___|___  "
    @d = "            |   |     "
    @e = "      b   " + @b_1 +" | "+ @b_2 +" | " + @b_3
    @f = "         ___|___|___  "
    @g = "            |   |     "
    @h = "      c   " + @c_1 +" | "+ @c_2 +" | " + @c_3
    @i = "            |   |     "

  end

#fonction: afficher le board.
  def display
    puts @o
    puts @a
    puts @b
    puts @c
    puts @d
    puts @e
    puts @f
    puts @g
    puts @h
    puts @i
    puts " "
  end
end
