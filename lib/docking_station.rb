require './lib/bike'

class DockingStation
   attr_reader :bikes

    def initialize
      @bikes = []
    end

    def release_bike
        if @bikes.empty?
          raise Exception.new 'No bikes yet!'
        else
          @bikes.pop
        end
    end

    def docking_bike(bike)
      return @bikes << bike
    end
end
