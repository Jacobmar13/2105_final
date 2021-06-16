require 'rspec'
require './lib/car'
require './lib/train'
require './lib/train_yard'

RSpec.describe TrainYard do
  context '(Iteration 2)' do
    before :each do
      @car1 = Car.new({type: 'Mail', weight: 5})
      @car2 = Car.new({type: 'Passengers', weight: 1})
      @car3 = Car.new({type: 'Cattle', weight: 3})
      @car4 = Car.new({type: 'Dining', weight: 4})
      @train1 = Train.new({name: 'Thomas', type: 'Tank'})
      @train2 = Train.new({name: 'Emily', type: 'Tender'})
      @train3 = Train.new({name: 'Nia', type: 'Tank'})
      @train4 = Train.new({name: 'Gordon', type: 'Express'})
      @train_yard = TrainYard.new({location: 'Brighton'})
      @train1.add_cars(@car1, 5)
      @train1.add_cars(@car2, 2)
      @train2.add_cars(@car1, 3)
      @train2.add_cars(@car4, 4)
      @train3.add_cars(@car1, 1)
      @train4.add_cars(@car4, 5)
      @train4.add_cars(@car3, 10)
      @train_yard.add_train(@train1)
      @train_yard.add_train(@train2)
      @train_yard.add_train(@train3)
      @train_yard.add_train(@train4)
    end

    it 'exists' do
      expect(@train_yard).to be_a(TrainYard)
    end

    it 'can show what trains it has' do
      expect(@train_yard.trains).to eq([@train1, @train2, @train3, @train4])
    end

    it 'can show weight for a train class object' do
      expect(@train1.weight).to eq(27)
    end

    it 'can show the types of trains in a train yard' do
      expect(@train_yard.types_of_trains).to eq(['Express', 'Tank', 'Tender'])
    end

    it 'can give trains containing a car type' do
      expect(@train_yard.trains_containing(@car1)).to eq([@train1, @train2, @train3])
    end
  end

  context '(Iteration 3)' do
    before :each do
      @car1 = Car.new({type: 'Mail', weight: 5})
      @car2 = Car.new({type: 'Passengers', weight: 1})
      @car3 = Car.new({type: 'Cattle', weight: 3})
      @car4 = Car.new({type: 'Dining', weight: 4})
      @train1 = Train.new({name: 'Thomas', type: 'Tank'})
      @train2 = Train.new({name: 'Emily', type: 'Tender'})
      @train3 = Train.new({name: 'Nia', type: 'Tank'})
      @train4 = Train.new({name: 'Gordon', type: 'Express'})
      @train_yard = TrainYard.new({location: 'Brighton'})
      @train1.add_cars(@car1, 5)
      @train2.add_cars(@car1, 3)
      @train2.add_cars(@car4, 4)
      @train3.add_cars(@car1, 4)
      @train4.add_cars(@car4, 5)
      @train4.add_cars(@car3, 10)
      @train_yard.add_train(@train1)
      @train_yard.add_train(@train2)
      @train_yard.add_train(@train3)
      @train_yard.add_train(@train4)
    end

    it 'has a sorted cargo list' do
      expect(@train_yard.sorted_cargo_list).to eq(['Cattle', 'Dining', 'Mail'])
    end

    it 'can give total inventory' do
      expect(@train_yard.total_inventory).to eq({
        @car1 => 12,
        @car3 => 10,
        @car4 => 9
      })
    end

    it 'can show overflow cars' do
      expect(@train_yard.overflow_cars).to eq([@car1])
    end
  end
end