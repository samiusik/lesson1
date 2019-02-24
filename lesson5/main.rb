require_relative "train.rb"
require_relative "carriage.rb"
require_relative "cargo_carriage.rb"
require_relative "cargo_train.rb"
require_relative "passenger_carriage.rb"
require_relative "passenger_train.rb"
require_relative "route.rb"
require_relative "station.rb"
require_relative "menu.rb"
require_relative "moduleInstanceCounter.rb"
require_relative "moduleManufacture.rb"

menu = Menu.new
menu.run
