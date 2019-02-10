class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
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
end


class Rout
  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
  end

  def add_stations(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    if [@stations.first, @stations.last].include?(station)
      puts "нельзя удалить начальную и конечную станцию"
    else
      @stations.delete(station)
    end
  end

  def get_stations
    @stations.each do |station|
      puts "#{@stations.index(station) + 1}: #{station.name}"
    end
  end
end


class Train
  attr_accessor :speed
  attr_reader :quantity_wagon, :route, :number, :current_station

  def initialize(number, type, quantity_wagon)
    @number = number
    @type = type
    @speed = 0
    @routs_position = 0
    @quantity_wagon = quantity_wagon
  end

  def stop
    speed = 0
  end

  def add_carrige
    @quantity_wagon += 1 if speed == 0
  end

  def remove_carrige
    @quantity_wagon -= 1 if speed == 0 && quantity_wagon > 0
  end

  def set_route(new_route)
    @route = new_route
    @current_station = @route.stations.first
    @current_station.get_train(self)
  end

  def next_station
    @route.stations[@routs_position + 1] unless @routs_position ==  @route.stations.size - 1
  end

  def prev_station
    @route.stations[@routs_position - 1] unless @routs_position.zero?
  end

  def move_forward
    station_index = @route.stations.index(@current_station)
    if station_index >= @route.stations.size - 1
      puts "end of rout"
    else
      @current_station = @route.stations[station_index + 1]
      @current_station.get_train(self)
    end
  end

  def move_back
    station_index = @route.stations.index(@current_station)
    if station_index <= 0
      puts "begin of rout"
    else
      @current_station = @route.stations[station_index - 1]
      @current_station.get_train(self)
    end
  end
end
