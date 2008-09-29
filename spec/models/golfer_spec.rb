require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Golfer do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :earnings => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Golfer.create!(@valid_attributes)
  end
end
