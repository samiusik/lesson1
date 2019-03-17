class Rout
  include InstanceCounter

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

  def valid?
    validate!
  rescue StandardError
    false
end

  private

  attr_reader :first, :last, :stations
  def validate!
    stations.each { |station| raise 'Начальная или конечная не является объектом класса' unless station.is_a?(Station) }
    true
  end
end
