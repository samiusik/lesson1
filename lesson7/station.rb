require_relative 'instance_counter'

class Station
  include InstanceCounter

  STATION_NAME = /[a-z]{3,}/i

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
    validate!
    register_instance
    @@all[name] = self
  end

  def each_train
    @trains.each do |train|
      yield train
    end
  end

  @@all = {}
  def self.all_obj
    @@all.each {|names| puts names}
  end

  def get_train(train)
    @trains << train
  end

  def trains_by_type(type)
    trains.select { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise ArgumentError, 'Название должно содержать от 3-ёх букв ' if name !~ STATION_NAME
    true
  end
end
