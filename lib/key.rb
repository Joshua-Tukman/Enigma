class Key
  attr_reader :key

  def initialize(five_digits)
    @key = five_digits
  end

  def a_key
    key[0..1].to_i
  end

  def b_key
    key[1..2].to_i
  end

  def c_key
    key[2..3].to_i
  end

  def d_key
    key[3..4].to_i
  end

end
