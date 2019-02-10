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
  attr_accessor :speed, :current_station
  attr_reader :qty_wagon, :route, :number

  def initialize(number, type, qty_wagon)
    @number = number
    @type = type
    @speed = 0
    @qty_wagon = qty_wagon
  end

  def stop
    speed = 0
  end

  def add_carrige
    if speed == 0
      @qty_wagon += 1
    end
  end

  def remove_carrige
    if speed == 0 && qty_wagon > 0
      @qty_wagon -= 1
    end
  end

  def set_routs(routs)
    @routs = routs
    @current_station = @routs.stations.first
    @current_station.get_train(self)
  end

  def next_station
    station_index = @routs.stations.index(@current_station)
    if station_index >= @routs.stations.size - 1
      puts "end of routs"
    else
      puts "next station is - #{@routs.stations[station_index + 1].name}"
    end
  end

  def previous_station
    station_index = @routs.stations.index(@current_station)
    if station_index <= 0 
      puts "begin of routs - #{@current_station.name}"
    else
      puts "previous station is - #{@routs.stations[station_index - 1].name}"
    end
  end

  def move_forward
    station_index = @routs.stations.index(@current_station)
    if station_index >= @routs.stations.size - 1
      puts "end of routs"
    else
      @current_station = @routs.stations[station_index + 1]
      @current_station.get_train(self)
    end
  end

  def move_back
    station_index = @routs.stations.index(@current_station)
    if station_index <= 0
      puts "begin of routs"
    else
      @current_station = @routs.stations[station_index - 1]
      @current_station.get_train(self)
    end
  end
end
