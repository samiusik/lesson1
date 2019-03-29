class PassengerTrain < Train
  validate :number, :format, /^[\w\d]{3}-?[\w\d]{2}$/
  validate :type, :train_type, 'Cargo'

  def initialize(number)
    @type = 'passenger'
    super
  end
end
