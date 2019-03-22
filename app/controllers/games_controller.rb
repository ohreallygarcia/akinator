class GamesController < ApplicationController
  def create
  	# créer un nouveau jeu et rediriger vers édit automatiquement
  	redirect_to edit_game_path(1), method: :get
  end

  def edit
  end

  def update
  	redirect_to game_path(1), method: :get
  end

  def show
  end
end
