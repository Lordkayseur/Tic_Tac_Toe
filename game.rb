require_relative 'board.rb'
require_relative 'board_case.rb'
require_relative 'player.rb'

class Game
  attr_accessor :first_player, :second_player, :choice_player1, :choice_player2,  :array, :another_answer
  attr_reader :the_board, :victory

  def initialize #initialisation d'une partie.
	@first_player = Player.new("joueur 1") #création joueur 1.
	@second_player = Player.new("joueur 2") # création joueur 2.
	  self.create_board #création du board.
	  self.play_until_victory #on appelle la fonction qui entame la partie.
  end

  def create_board #création de 9 insntances Cases avec nom et valeur " " pour montrer qu'elles sont vides au debut d'une partie.
	@a1 = Cases.new("a1", " ")
	@a2 = Cases.new("a2", " ")
	@a3 = Cases.new("a3", " ")
	@b1 = Cases.new("b1", " ")
	@b2 = Cases.new("b2", " ")
	@b3 = Cases.new("b3", " ")
	@c1 = Cases.new("c1", " ")
	@c2 = Cases.new("c2", " ")
	@c3 = Cases.new("c3", " ")

    puts "  __________________________________________________________________________________________________________  "
    puts " |                                              TIC TAC TOE                                                 | "
    puts " |__________________________________________________________________________________________________________| "




	@the_board = Board.new(@a1.position, @a2.position, @a3.position, @b1.position, @b2.position, @b3.position, @c1.position, @c2.position, @c3.position)  #Création d'un Board ou l'on definit 9 variables comme etant la valeur de nos 9 cases vide " ".
	@the_board.display   #affichage du Board vide.
	@array = [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]   #création d'un array avec nos 9 cases pour garder a jour les valeurs des cases durant la partie.
  end

  def maj_board #fonction: Maj.
	@the_board = Board.new(array[0].position, array[1].position, array[2].position, array[3].position, array[4].position, array[5].position, array[6].position, array[7].position, array[8].position) #création du nouveau tableau.
	@the_board.display #affichage du tableau.
  end

  def check_if_victory #fonction: conditions de victoires.
	@victory = false
	  case
	 	when array[0].position == @a1.position && array[1].position == array[2].position && array[2].position != " "
	     @victory = true
		when array[3].position == array[4].position && array[4].position == array[5].position && array[5].position != " "
		 @victory = true
		when array[6].position == array[7].position && array[7].position == array[8].position && array[8].position != " "
		 @victory = true
		when array[0].position == array[3].position && array[3].position == array[6].position && array[6].position != " "
	     @victory = true
		when array[1].position == array[4].position && array[4].position == array[7].position && array[7].position != " "
		 @victory = true
		when array[2].position == array[5].position && array[5].position == array[8].position && array[8].position != " "
		 @victory = true
		when array[0].position == array[4].position && array[4].position == array[8].position && array[8].position != " "
		 @victory = true
		when array[2].position == array[4].position && array[4].position == array[6].position && array[6].position != " "
		 @victory = true
	  end
  end

  def first_player_plays #fonction: tour du premier joueur.
	@choice_player1 = first_player.ask_play #on demande une coordonnée de case qu'on stock dans une variable.
	unless first_player.verification_coordonnees == true #on verifie si les coordonnées sont écrites. (grâce à verification_coordonnees).
	       first_player.error #si verification_coordonnees = false on affiche un message d'erreur.
	 	   @choice_player1 = first_player.ask_play  #on relance ask_play pour redemander au premier joueur une coordonnee.
	end


 	@array.map do |x| #pour tout les elements du array qui stock les Cases.
	  if x.value == @choice_player1 && x.check_if_empty  #si le nom de la case = le choix du joueur et si la case est vide.
	     x.fill_up_case("x")  #on change la valeur de la case avec une petite croix.
	     first_player.success_case #on lance un message qui dit que la case est bonne.
	  elsif x.value == @choice_player1 && !x.check_if_empty  #si le nom de la case = le choix du joueur mais la case n'est pas vide.
		  first_player.error #on affiche un message d'erreur.
		  @choice_player1 = first_player.ask_play  #on relance ask_play pour redemander au joueur une coordonnee.
	  end
    end

	maj_board #modofication du board suite a l'ajout du joueur.
	check_if_victory #vérification de si le joueur a gagné ou non.

	  if @victory == true #si le joueur a gagné.
	     first_player.winner #fonction winner qui affiche le message de victoire.
	     another_game #fonction pour savoir si les joueurs veulent de relancer une partie.
	  end
  end

  def second_player_plays #fonction: tour du deuxième joueur.
	@choice_player2 = second_player.ask_play #on demande une coordonnée de case qu'on stock dans une variable.
	unless second_player.verification_coordonnees == true #on verifie si les coordonnées sont écrites. (grâce à verification_coordonnees).
	  	   second_player.error #si verification_coordonnees = false on affiche un message d'erreur.
	 	   @choice_player2 = second_player.ask_play #on relance ask_play pour redemander au deuxième joueur une coordonnee.
	end

	@array.map do |x| #pour tout les elements du array qui stock les Cases.
	  if x.value == @choice_player2 && x.check_if_empty #si le nom de la case = le choix du joueur et si la case est vide.
		 x.fill_up_case("o") #on change la valeur de la case avec un petit rond.
		 second_player.success_case #on lance un message qui dit que la case est bonne.
	  elsif x.value == @choice_player2 && !x.check_if_empty #si le nom de la case = le choix du joueur mais la case n'est pas vide.
			second_player.error #on affiche un message d'erreur.
			@choice_player2 = second_player.ask_play  #on relance ask_play pour redemander au joueur une coordonnee.
	  end
	end

	maj_board

	check_if_victory

	  if @victory == true
		 second_player.winner
		 another_game
	  end
  end

 #fonction pour alterné le tour du premier et deuxième joeur.
  def play_until_victory
	until victory == true
		  first_player_plays
		  second_player_plays
	end
  end

 #fonction: rejouer.
  def another_game
  	puts "Voulez-vous rejouer ?(o/n)"


  @another_answer = gets.chomp.downcase
 #fonction: rejouer, si oui.
	if another_answer == "o"
	puts "LET'S GO !"




	  create_board #creation d'un nouveau board.
	  victory == false #on change la variable de victory a false.
	  play_until_victory #on relance une partie.
 #fonction: rejouer, si non (on quitte le programme).
else puts "À la prochaine."
	  exit
	end
  end
end

mon_jeu = Game.new
