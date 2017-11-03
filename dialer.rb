class Dialer

  def initialize(keys, number_length)
    @keypad = keys
    @number_length = number_length
  end

  
  def next_keys(current_key)
    x, y = @keypad.find_key_placement(current_key)

    coords = []

    coords << [x - 2, y - 1]
    coords << [x - 2, y + 1]
    coords << [x + 2, y - 1]
    coords << [x + 2, y + 1]
    coords << [x - 1, y - 2]
    coords << [x - 1, y + 2]
    coords << [x + 1, y - 2]
    coords << [x + 1, y + 2]
    
    valid_coords = coords.reject do |x| 
      x[0] < @keypad.vertical_bounds.min || 
      x[0] > @keypad.vertical_bounds.max ||
      x[1] < @keypad.horizontal_bounds.min || 
      x[1] > @keypad.horizontal_bounds.max
    end

    valid_coords.map { |x| @keypad.keypad[x[0]][x[1]] }.reject(&:nil?)
  end


  def dialing_combinations(dialed_digits)
    if dialed_digits.to_s.length == @number_length
      dialed_digits
    else
      next_digits = next_keys(dialed_digits.to_s.chars.last.to_i)
      
      next_digits.map { |x| dialing_combinations("#{dialed_digits}#{x}") }
    end
  end

  
  def dial
    starting_keys = @keypad.valid_digits

    possible_numbers = []
    starting_keys.each do |digit|
      possible_numbers << dialing_combinations(digit)
    end

    possible_numbers.flatten
  end

end

