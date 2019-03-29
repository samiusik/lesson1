class CargoTrain < Train
  validate :number, :format, /^[\w\d]{3}-?[\w\d]{2}$/
  validate :type, :train_type, 'Cargo'

  def initialize(number)
    @type = 'cargo'
    super
  end
end
