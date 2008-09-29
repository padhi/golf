require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/golfers/index.html.erb" do
  include GolfersHelper
  
  before(:each) do
    assigns[:golfers] = [
      stub_model(Golfer,
        :name => "value for name",
        :earnings => "1"
      ),
      stub_model(Golfer,
        :name => "value for name",
        :earnings => "1"
      )
    ]
  end

  it "should render list of golfers" do
    render "/golfers/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

