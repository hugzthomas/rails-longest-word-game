class GameController < ApplicationController

  def play
     @grid = Array.new(9) { ('A'..'Z').to_a[rand(26)] }
  end

  def score
    @starting_time = params[:starting_time].to_time
    @attempt = params[:attempt]
    @grid = params[:grid].split("")
    result = @attempt.upcase.split('').all? do |letter|
      @attempt.count(letter) <= @grid.count(letter)
    end
    guess = File.read('/usr/share/dict/words').upcase.split("\n").include? @attempt.upcase
    time_taken = Time.now - @starting_time
    if result && guess
      score = @attempt.size * (1.0 - time_taken / 60.0)
      @message = "Congrats brother ! Your score is #{score}..."
    else
      @message = "You suck dude ! that's not even a word your score is O"
    end
  end

end

