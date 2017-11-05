require_relative 'field.rb'
require_relative 'player.rb'

class Game

    attr_accessor :field, :first_player, :second_player, :tie_count
    #@tokens = [0,1]
    def initialize()
        print "First player please enter your name: "
        name = gets.chomp
        puts "Your symbol is X"
        @first_player = Player.new(name, 'X', 0)
        print "Second player please enter your name: "
        name = gets.chomp
        puts "Your symbol is O"
        @second_player = Player.new(name, 'O', 0)
        @players = [@first_player, @second_player]
        @tie_count = 0
    end

    def make_move(cell, mark)
        @field.update(mark, cell)
        @field.vizualize()
    end

    def session()
        @field = Field.new()
        @field.num_visual()
        count = 0

        while !@field.full?() && !@field.win?('X') && !@field.win?('O')

            puts "#{@players[count%2][0]} make your move:"
            move = gets.chomp.to_i - 1
            if @field.valid?(move)
                make_move(move, @players[count % 2][1])
                puts "#{@field.full?()}      #{@field.win?('X')}     #{@field.win?('O')}"
                count += 1
            else
                puts "Uncorrect move"
            end
        end
        
        if @field.win?('X')
            puts "Grats #{first_player.name}"
            first_player.wins_count += 1
        elsif @field.win?('O')
            puts "Gratz #{second_player.name}"
            second_player.wins_count += 1
        else
            puts "Noone wanna win?"
            @tie_count += 1
        end
    end

    def result()
        puts "#{first_player.name} wins: #{first_player.wins_count}"
        puts "#{second_player.name} wins: #{second_player.wins_count}"
        puts "Ties: #{@tie_count}"
    end

end
