require_relative "game.rb"
game = Game.new()

puts "Hello to the best tic-tac-toe game ever (:Kappa:)"
command = ""

while command != "stop"
    puts "So what you want? \n Type: new for new game \t stat for statistic \t or stop for end game"
    command = gets.strip.downcase()
    
    if command == "new"
        game.session()
    elsif command == "stat"
        game.result()
    elsif command != "stop"
        puts "Type something correct"
    end

    puts "Hope see you soon!"
end   
