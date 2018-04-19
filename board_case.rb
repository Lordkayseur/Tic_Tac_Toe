class Cases
  attr_accessor :value, :position

 #une case a un nom a1, a2, a3, b1, b2, b3, c1, c2, c3. et une valeur qui est " ", "x" ou "o"
  def initialize(value, position)
	@value = value
	@position = position
  end

 #fonction:  changer la valeur de la case.
  def fill_up_case(pion)
	self.position = pion
  end

 #fonction: virifaction de la case.
  def check_if_empty
	true if self.position == " " #on vérifie si la case est libre.
  end
end
