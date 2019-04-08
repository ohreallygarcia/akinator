class GamesController < ApplicationController
  
  student1 = {
    "name" => "Pauline",
    "answers" => ["yes", "no", "no", "no"]
  }
  student2 = {
    "name" => "Arthur",
    "answers" => ["yes", "no", "no", "yes"]
  }
  STUDENTS = [ student1, student2 ]


    QUESTIONS = [ 
     "A-t-il les yeux clairs?",
     "Est-ce un homme ?",
     "Est-il vegan ?" ,
     "Es-tu originaire d'Aquitaine ?"]


  def create
    @game =  Game.create
  	# créer un nouveau jeu et rediriger vers édit automatiquement
  	redirect_to edit_game_path(@game["id"], question_id: 0), method: :get
  end

  def edit
   # @question = Questions[params["question_id"].to_i] #
    @game_id = params["id"]
    @question_id = params["question_id"].to_i
    @question = QUESTIONS[@question_id]
  end

  # def update
  	
  #   question_id = params["question_id"].to_i + 1
  #   @game = Game.find(params["id"])
  #   @game["answers"] << params["answer"]
  #   @game.save

  #   if question_id > 3
  #     redirect_to game_path(@game["id"]), method: :get
  #   else 
  #     redirect_to edit_game_path(@game["id"], question_id: question_id), method: :get
  #   end
  # end

  def update
    @game_id = params["id"]
    @game = Game.find(@game_id)
    @game["answers"] << params["answer"]
    @game.save
    @question_id = params["question_id"].to_i + 1
    if @question_id < QUESTIONS.size
      redirect_to edit_game_path(id: @game_id, question_id: @question_id), method: :get
    else
      redirect_to game_path(id: @game_id), method: :get
    end
  end

  # def show
  #   @game = Game.find(params["id"])
  # end
   def show
    @game_id = params["id"]
    @game = Game.find(@game_id)
    @answers = @game["answers"]
    @students = STUDENTS
  end
end