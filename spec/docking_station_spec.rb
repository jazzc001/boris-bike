# commit " initialise rspec and add the first test"
require './lib/docking_station'

describe DockingStation do
  let(:dockingstation) {DockingStation.new}
  let(:bike) {Bike.new}


  it "returns release bike" do
    expect(subject).to respond_to(:release_bike)
  end

  it 'gets and expects a bike to be workig' do
    subject.docking_bike(bike)
    expect(subject.release_bike).to be_an_instance_of(Bike)
  end

  it 'docks a bike' do 
    expect(subject).to respond_to(:docking_bike)
  end

  it 'docking bike returns the bike' do
    subject.docking_bike(bike)
    results = subject.bikes
    expect(results).to eq([bike])
  end

  it 'raise_error when no bike in docking station' do
    expect do
      subject.release_bike
    end.to raise_error
  end

  it 'raise_error when docking station is full' do
    expect do
      DEFAULT_CAPACITY.times {subject.docking_bike Bike.new }
    end.to raise_error
  end 

  it 'allow user set capacity' do
    docking_station = DockingStation.new(30)
    expect(docking_station.DEFAULT_CAPACITY).to eq(30)
  end
  
  # it 'Does nto release a broken bike in .release_bike' do
  #    subject.docking_bike(bike, "broken")
  #    expect(subject.release_bike).to eq "bike is broken"
  # end

  # it "Doen not release a broken bike" do
  #   bike3 = Bike.new
  #   puts bike3
  #   subject.docking_bike(bike3, "good")
  #   bike1 = Bike.new
  #   puts bike1
  #   subject.docking_bike(bike3, "broken")
  #   bike2 = Bike.new
  #   puts bike2
  #   subject.docking_bike(bike3, "good")

  #   subject.docking_bike(bike2, "broken")
  #   expect(subject.release_bike).to eq bike2
  #   expect(subject.release_bike).to eq "bike is broken"
  #   expect(subject.release_bike).to eq bike3
  # end

  it "report bike as broken when docking" do
    bike1 = Bike.new
    subject.docking_bike(bike1, "broken")
    expect(bike1.condition).to eq("broken")
  end

  it "Does not release a broken bike in .release_bike" do
     bike1 = Bike.new
     subject.docking_bike(bike1, "broken")
     expect{subject.release_bike}.to raise_error
  end

  it "Doen not release a broken bike" do
      bike1 = Bike.new
      puts bike1
      subject.docking_bike(bike1, "broken")
      bike2 = Bike.new
      puts bike2
      subject.docking_bike(bike2, "broken")
      bike3 = Bike.new
      puts bike3
      subject.docking_bike(bike3)
      expect(subject.release_bike).to eq bike3
      # expect(subject.release_bike).to eq "bike is broken"
      # expect do
      #   subject.release_bike
      #   subject.release_bike
      # end.to eq bike3
    end

end