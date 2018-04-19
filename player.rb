class Player
  attr_accessor :name, :answer_play, :numberjoueur

 #on demande le prénom du joueur.
  def initialize(number_player)
	puts "  - HELLO! #{number_player}, comment tu t'appelles ? "
	@name = gets.chomp.capitalize
	puts "  - Ok #{@name}, READY ?! "
	puts " "
  end

 #fonction: quelle coordonnee de case le joueur veux jouer ?
  def ask_play
	puts "  - tu joue quoi #{@name} ? (Donne les coordonnees comme à la bataille navale, ex : a2, b3, c1, etc.) "
	@answer_play = gets.chomp #on enregistre la reponse du joueur dans @answer_play.
  end

 #fonction: vérification des coordonnees du joueur avec les coordonnees du jeu.
  def verification_coordonnees
	coordonnees = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
	true if coordonnees.include? @answer_play #retourne true si la reponse du joueur et bien dans le tableau.
  end

 #phrase si le joueur a rentré une coordonnée correspondante et libre.
  def success_case
	puts "  - Ok #{@name}, c'est ton choix #{@answer_play}"
	puts " "
  end

 #phrase si  un joueur fais un choix de case impossible.
  def error
	puts "  - Désolé #{@name}, ce n'est pas possible, rejoue !  "
	puts " "
  end

 #phrase si un joueur a gagné.
  def winner
	puts "  - GG! #{@name} !!!! TU L'AS NIQUÉ !!! "
	puts " "
  end
end
