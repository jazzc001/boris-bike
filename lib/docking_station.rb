require './lib/bike'

class DockingStation
   attr_reader :bikes, :defaul_capacity

    def initialize
      @bikes = []
      @defaul_capacity = 5
    end

    def release_bike
        if @bikes.empty?
          raise Exception.new 'No bikes yet!'
        else
          @bikes.pop
        end
    end

    def docking_bike(bike)
        if @bikes.size == @defaul_capacity
          raise Exception.new 'Station is full!'
        else
          return @bikes << bike
        end
    end
end
