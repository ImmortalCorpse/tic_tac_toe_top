class Field
    WIN_COMBS = [ [0,1,2], [0,3,6], 
    [1,4,7], [3,4,5],
    [6,7,8], [2,5,8], 
    [0,4,8], [2,4,6] ]

    attr_accessor :field

    def initialize()
        @field = Array.new(9, '+')
    end

    def vizualize()
		breaker = 1
		@field.each{|val|
			print val
			if breaker % 3 == 0 && breaker != 9
				print "\n" + "-----".center(6) + "\n"
			elsif breaker % 3 != 0
				print "|"
			end
            breaker += 1}
            puts
    end

    def num_visual()
       num_field = Field.new()
       num_field.field = (1..9).to_a
       num_field.vizualize() 
    end
    
    def update(token, cell)
       @field[cell] = token 
    end

    def full?()
        @field.none? {|cell| cell == '+'}
    end

    def valid?(cell)
        (cell >= 0 && cell < 9) && @field[cell] == '+'
    end

    def win?(mark)
        WIN_COMBS.each{|combo| 
        #puts "#{combo[0]} #{combo[1]}   #{combo[2]} "
        if @field[combo[0]] == mark && @field[combo[1]] == mark && @field[combo[2]] == mark
        #puts "#{@field[combo[0]]}  #{@field[combo[1]]}  #{@field[combo[2]]}"
        return true
        end}
        return false 
    end
end
