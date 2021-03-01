class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a
  end

  def game; end
end
