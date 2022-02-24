require './lib/bike'

class DockingStation
   attr_reader :bikes, :defaul_capacity

    def initialize
      @bikes = []
      @defaul_capacity = 20
    end

    def release_bike
        if empty?
          raise Exception.new 'No bikes yet!'
        else
          @bikes.pop
        end
    end

    def docking_bike(bike)
        if full?
          raise Exception.new 'Station is full!'
        else
          return @bikes << bike
        end
    end

    private

    def full?
        @bikes.size == @defaul_capacity
    end

    def empty?
        @bikes.empty?
    end
end
