class CargoCarriage < Carriage
  attr_reader :volume, :total_volume
  
  def initialize(total_volume)
    @type = 'Cargo'
    @total_volume = total_volume
    @busy_volume = 0
  end

  def take_volume(volume)
    @busy_volume += volume if @total_volume > @busy_volume + volume
  end

  def busy_volume
    @busy_volume
  end

  def free_volume
    @total_volume - @busy_volume
  end
end
