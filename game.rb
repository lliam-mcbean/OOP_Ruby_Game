require_relative './player.rb'

class Game

    def initialize
        @player1 = Player.new("Lliam")
        @player2 = Player.new("Satan")
        @players = [@player1, @player2]
        @round = 1
    end

    def play
        while(@player1.lives > 0 && @player2.lives > 0 && @round < 16) do
            active_player = @players.first
            innactive_player = @players.last

            number1 = rand(1..10)
            number2 = rand(1..10)
            total = number1 + number2

            puts "-----------------------------"
            puts "        Round #{@round}"
            puts "-----------------------------"
            puts
            puts "#{active_player.name} is u. Answer a skill testing math question!"
            puts
            puts 
            puts
            puts "What is #{number1} plus #{number2}?"
            puts
            input = gets.chomp

            if "#{total}" != input
                active_player.lost_point
            end

            # END OF GAME
            @round += 1
            @players.rotate!
        end

        if (@player1.lives > @player2.lives)
            puts "Congrats #{@player1.name}!"
            puts "#{@player2.name} Get Better."
        elsif (@player1.lives < @player2.lives)
            puts "Congrats #{@player1.name}!"
            puts "#{@player2.name} Get Better."
        else
            puts "You're both equally something"
        end
    end
end