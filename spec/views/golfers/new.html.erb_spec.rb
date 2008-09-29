require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/golfers/new.html.erb" do
  include GolfersHelper
  
  before(:each) do
    assigns[:golfer] = stub_model(Golfer,
      :new_record? => true,
      :name => "value for name",
      :earnings => "1"
    )
  end

  it "should render new form" do
    render "/golfers/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", golfers_path) do
      with_tag("input#golfer_name[name=?]", "golfer[name]")
      with_tag("input#golfer_earnings[name=?]", "golfer[earnings]")
    end
  end
end


