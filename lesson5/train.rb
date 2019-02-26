require_relative 'manufacture.rb'
require_relative 'instance_counter.rb'

class Train

  include InstanceCounter
  include Manufacture

  attr_accessor :speed
  attr_reader :route, :number, :current_station
  
  def initialize(number)
    @number = number
    @speed = 0
    @routs_position = 0
    @carriages = []
    @@all_trains[@number] = self
    register_instance
  end

  @@all_trains = {}
  def self.find(number)
    @@all_trains[number]
  end

  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
    @carriages << carriage if speed == 0 && @type == carriage.type
  end

  def remove_carriage
    @carriages.shift if speed == 0
  end

  def set_route(new_route)
    @route = new_route
    @current_station = @route.stations.first
    @current_station.get_train(self)
    @station_index = @route.stations.index(@current_station)
  end

  def next_station
    @route.stations[@routs_position + 1] unless @routs_position ==  @route.stations.size - 1
  end

  def prev_station
    @route.stations[@routs_position - 1] unless @routs_position.zero?
  end

  def move_forward
    if @station_index >= @route.stations.size - 1
      puts "end of rout"
    else
      @current_station = @route.stations[@station_index + 1]
      @current_station.get_train(self)
    end
  end

  def move_back
    if @station_index <= 0
      puts "begin of rout"
    else
      @current_station = @route.stations[@station_index - 1]
      @current_station.get_train(self)
    end
  end
end
