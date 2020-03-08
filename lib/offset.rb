class Offset
  attr_reader :date, :squared

  def initialize(date = Date.today.strftime('%d%m%y'))
    @date = date
    @squared = date.to_i ** 2
  end

  def last_four
    @squared.to_s[-4..-1]
  end

  def a_offset
    last_four[0].to_i
  end
  # square = date.to_i ** 2
  # last_four = square.to_s[-4..-1]
  #
  # a_offset = last_four[0].to_i
  # b_offset = last_four[1].to_i
  # c_offset = last_four[2].to_i
  # d_offset = last_four[3].to_i

end
