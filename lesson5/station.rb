class Station

  include InstanceCounter
  
  @@all = {}
  def self.all_obj
    @@all.each {|names| puts names}
  end

  attr_reader :name, :trains, @@all[name] = self

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
