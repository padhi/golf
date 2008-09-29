require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/golfers/edit.html.erb" do
  include GolfersHelper
  
  before(:each) do
    assigns[:golfer] = @golfer = stub_model(Golfer,
      :new_record? => false,
      :name => "value for name",
      :earnings => "1"
    )
  end

  it "should render edit form" do
    render "/golfers/edit.html.erb"
    
    response.should have_tag("form[action=#{golfer_path(@golfer)}][method=post]") do
      with_tag('input#golfer_name[name=?]', "golfer[name]")
      with_tag('input#golfer_earnings[name=?]', "golfer[earnings]")
    end
  end
end


