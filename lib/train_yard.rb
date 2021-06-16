class TrainYard
  attr_reader :trains

  def initialize(attributes)
    @location = attributes[:location]
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def types_of_trains
    @trains.map do |train|
      train.type
    end.uniq.sort
  end

  def trains_containing(car)
    @trains.map do |train|
      if train.cargo.keys.include?(car)
        train
      end
    end
  end

  def sorted_cargo_list
    @trains.map do |train|
      train.cargo.map do |car, amount|
        car.type
      end
    end.flatten.uniq.sort
  end

  def total_inventory
    inventory = Hash.new(0)
    @trains.each do |train|
      train.cargo.each do |car, amount|
        inventory[car] += amount
      end
    end
    inventory
  end

  def overflow_cars
    inventory = []
    total_inventory.each do |car, amount|
      require 'pry';binding.pry
      if amount > 10
        inventory << car
      end
    end
    inventory
  end
end