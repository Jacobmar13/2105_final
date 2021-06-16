class Train
  attr_reader :name, :type, :cargo

  def initialize(attributes)
    @name = attributes[:name]
    @type = attributes[:type]
    @cargo = Hash.new(0)
  end

  def count_cars(car)
    @cargo[car]
  end

  def add_cars(car, amount)
    @cargo[car] += amount
  end

  def weight
    @cargo.sum do |car, amount|
      car.weight * amount
    end
  end
end