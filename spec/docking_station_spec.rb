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
      @defaul_capacity.times {|subject| subject.docking_bike(bike) }
      
    end.to raise_error
  end 

end