require './lib/bike'

class DockingStation
   attr_reader :bikes, :DEFAULT_CAPACITY

    def initialize(capacity=20)
      @bikes = []
      @DEFAULT_CAPACITY = capacity
    end

    def release_bike
      empty?
      i = 0
      bikes = self.bikes
      while true do
        if bikes[i].condition == "good"
            return bikes[i]
            bikes.delete_at(i)
            break
        else
            i += 1
        end
      end
    end

    def dock(bike, condition = "good")
        full?
        if condition == "broken"
            bike.condition = "broken"
        end
        @bikes << bike

    end


    private

    def broken(bike)
        if bike.condition == "broken"
           return "broken"
        end
    end

    def full?
        if @bikes.size > @DEFAULT_CAPACITY 
            raise Exception.new 'Station is full!'
        end
    end

    def empty?
        if @bikes.empty?
            raise Exception.new 'No bikes yet!'
        end
    end
end
