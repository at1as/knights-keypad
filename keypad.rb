class Keypad
  
  #   1 2 3
  #   4 3 6
  #   7 8 9
  #     0

  attr_accessor :keypad

  
  def initialize(deadkeys = [])
    @deadkeys = deadkeys.uniq
    @keypad   = [[ 1,  2,  3 ],
                 [ 4,  5,  6 ],
                 [ 7,  8,  9 ],
                 [nil, 0, nil]]

    destroy_keys
  end

  
  def destroy_keys
    @keypad.map! { |row| row.map { |col| @deadkeys.include?(col) ? nil : col } }
  end


  def vertical_bounds
    [0, @keypad.length - 1]
  end

  
  def horizontal_bounds(row_num = 0)
    [0, @keypad[row_num].length - 1]
  end


  def valid_digits
    @keypad.flatten.reject(&:nil?).uniq
  end

  
  def invalid_digits
    (0..9).to_a - @keypad.flatten.uniq
  end


  def find_key_placement(target_key)
    @keypad.each_with_index do |row, idx1|
      row.each_with_index do |col, idx2|
        return [idx1, idx2] if @keypad[idx1][idx2].to_s == target_key.to_s
      end
    end
  end

end

