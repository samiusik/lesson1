class Rout
  include InstanceCounter
  include Validation

  validate :first_station, :type, Station
  validate :last_station, :type, Station

  attr_reader :stations

  def initialize(first, last)
    @first = first
    @last = last
    @stations = [first, last]
    validate!
  end

  def add_stations(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    if [@stations.first, @stations.last].include?(station)
      puts 'нельзя удалить начальную и конечную станцию'
    else
      @stations.delete(station)
    end
  end

  def get_stations
    @stations.each do |station|
      puts "#{@stations.index(station) + 1}: #{station.name}"
    end
  end

    private

  attr_reader :first, :last, :stations
end
