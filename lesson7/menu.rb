class Menu
  def initialize
    @stations = []
    @trains = []
    @route = nil
    @carriages = []
  end

  def run
    loop do
      puts '1. Создать станцию'
      puts '2. Создать поезд'
      puts '3. Создать маршрут'
      puts '4. Добавить станцию к маршруту'
      puts '5. Убрать станцию из маршрута'
      puts '6. Назначить маршрут поезду'
      puts '7. Прицепить вагон к поезду'
      puts '8. Отцепить вагон от поезда'
      puts '9. Передвинуть поезд вперёд по маршруту'
      puts '10. Передвинуть поезд назад по маршруту'
      puts '11. Посмотреть список станций'
      puts '12. Посмотреть список поездов на станции'
      puts '13. Посмотреть список вагонов в поезде'     
      puts '14. Занять место или объем в вагоне'
      puts '15. Выход'

      @choise = gets.to_i

      break if choise == 13

      change_choice
    end
  end

  private

  ROUTE_NOT_FOUND = 'Нет маршрута'
  CHANGE_STATION = 'Выберете станцию'

  attr_accessor :choise

  def change_choice
    case choise
      when 1 then
        create_station
      when 2 then
        create_train
      when 3 then
        create_route
      when 4 then
        add_station_to_route
      when 5 then
        delete_station_from_route
      when 6 then
        set_route_to_train
      when 7 then
        add_carriage
      when 8 then
        remove_carriage
      when 9 then
        move_forward
      when 10 then
        move_back
      when 11 then
        print_stations_list
      when 12 then
        print_trains_on_station
      when 13 then 
        show_carriages_in_train
      when 14 then        
        take_place_in_wagon
      else false
    end
  end

  def create_station
    puts 'Введите название станции'
    name = gets.chomp
    station = Station.new(name)
    @stations << station
  rescue ArgumentError => e
    puts e.message
    retry
  end

  def create_train
    puts 'Выберите тип поезда:'
    puts '1. Пассажирский'
    puts '2. Грузовой'
    choise = gets.to_i
    puts 'Номер поезда:'
    number = gets.chomp
    case choise
    when 1 then
      @trains << PassengerTrain.new(number)
    when 2 then
      @trains << CargoTrain.new(number)
    else
      create_train
    end
  rescue ArgumentError => e
    puts e.message
    retry
  end

  def create_route
    return 'Должно быть создано не менее двух станций' if @stations.size < 2

    print_stations_list

    puts 'Выберите начальную станцию:'
    first_station = gets.to_i
    puts 'Выберите конечную станцию:'
    last_station = gets.to_i

    if first_station != last_station
      @route = Route.new(@stations[first_station - 1], @stations[last_station - 1])
    else
      create_route
    end
  end

  def add_station_to_route
    return puts 'Нет станций' if @stations.empty?
    return puts ROUTE_NOT_FOUND if @route.nil?

    station = @stations[chose_station - 1]
    @route.add_station(station)
  end

  def print_stations_list
    @stations.each_with_index {|station, index| puts "Cтанция: #{index + 1}  #{station.name}"}
  end

  def chose_station
    print_stations_list
    puts CHANGE_STATION
    choise = gets.to_i
    choise <= @stations.size ? choise : chose_station
  end

  def delete_station_from_route
    return puts ROUTE_NOT_FOUND unless @route
    return puts 'В маршруте не может быть менее двух станций' if @route.stations.size == 2

    @route.stations.each_with_index {|station, index| puts "Cтанция #{index + 1} #{station.name}"}
    puts CHANGE_STATION
    choise = gets.to_i
    @route.delete_station(@stations[choise - 1]) if choise <= @route.stations.size
  end

  def set_route_to_train
    return ROUTE_NOT_FOUND unless @route

    train = chose_train
    train.set_route(@route)
  end

  def show_carriages_in_train
    train = choice_station
    if train.type == :cargo
      train.each_carriage do |i, c|
        puts "#{i + 1}: Грузовой #{c.free_volume}/#{c.busy_volume}"
      end
    else
      train.each_carriage do |i, c|
        puts "#{i + 1}: Пассажирский #{c.free_seats}/#{c.busy_seats}"
      end
    end
  end

  def chose_train
    return 'Нет поездов' unless @trains.any?

    @trains.each_with_index {|train, index| puts "#{index + 1}  #{train.number}"}

    puts 'Выберите поезд:'
    choise = gets.to_i
    choise <= @trains.size ? @trains[choise - 1] : chose_train
  end

  def add_carriage
    train = chose_train
    train.type == 'Passenger' ? (puts 'Введи количество мест:') : (puts 'Введи объем:')
    carriages = train.class == PassengerTrain ? PassengerCarriage.new : CargoCarriage.new
    train.add_carriage(carriages)
  end

  def remove_carriage
    train = chose_train
    train.remove_carriage
  end

  def print_trains_on_station
    station = @stations[chose_station - 1]
    station.trains.each { |train| puts "Поезд: #{train.number} #{train.class}" }
  end

  def move_forward
    train = chose_train
    return ROUTE_NOT_FOUND unless train.route

    train.move_forward
  end

  def move_back
    train = chose_train
    return ROUTE_NOT_FOUND unless train.route

    train.move_back
  end

  def take_place_in_wagon
    wagon = chose_wagon
    return unless @train
    if @train.type == 'Passenger'
      wagon.take_place
    else
      puts('Укажите объём')
      volume = gets.to_i
      wagon.take_volume(volume)
    end
  end

end
