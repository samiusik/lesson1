class Carriage
  attr_reader :type
  
  include Manufacture

  def initialize(type)
    @type = type
  end
end
