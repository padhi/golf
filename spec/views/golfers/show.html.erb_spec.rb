require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/golfers/show.html.erb" do
  include GolfersHelper
  
  before(:each) do
    assigns[:golfer] = @golfer = stub_model(Golfer,
      :name => "value for name",
      :earnings => "1"
    )
  end

  it "should render attributes in <p>" do
    render "/golfers/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
  end
end

