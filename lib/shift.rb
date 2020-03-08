class Shift
  attr_reader :key, :date

  def initialize(key, date)
    @key = key
    @date = date
  end

  def a_shift
    @key.a_key + @date.a_offset
  end

  def b_shift
    @key.b_key + @date.b_offset
  end

  def c_shift
    @key.c_key + @date.c_offset
  end

end
