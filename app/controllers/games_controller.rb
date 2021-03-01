require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a
    @vowels = %w(A E I O U Y)
    @sorted = (@letters.sample(5) + @vowels).shuffle
  end

  def score
    @word = params[:word].upcase
    @letters = @word.split('')
    @sorted = params[:sorted]

    @english = true_english(@word)
    # @includes = includes(@used_let, @sorted)
  end

  private

  # NO FUNCIONA. NOT A HASH. WTF!
  # def true_english(word)
  #   url = "https://wagon-dictionary.herokuapp.com/#{@word}"
  #   result = Net::HTTP.get(URI.parse(url))
  #   @true_english = result['found']
  #   raise
  # end

  def true_english(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{@word}")
    json = JSON.parse(response.read)
    @true_english = json['found']
  end

  # def includes(letters, sorted)
  #   letters.all? { |letter| letters.count(letter) <= sorted.count(letter) }
  # end

  # def include(letters, sorted)
  #   used_letters.each { |a| sorted.include?(a) }
  # end
end

# ERB CODE FOR SCORE
# <%= elsif !@includes %>
# <p><strong><%= @word.upcase %> should be built with the letters <%= @sorted %></strong></p>