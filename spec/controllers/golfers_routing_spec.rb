require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GolfersController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "golfers", :action => "index").should == "/golfers"
    end
  
    it "should map #new" do
      route_for(:controller => "golfers", :action => "new").should == "/golfers/new"
    end
  
    it "should map #show" do
      route_for(:controller => "golfers", :action => "show", :id => 1).should == "/golfers/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "golfers", :action => "edit", :id => 1).should == "/golfers/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "golfers", :action => "update", :id => 1).should == "/golfers/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "golfers", :action => "destroy", :id => 1).should == "/golfers/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/golfers").should == {:controller => "golfers", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/golfers/new").should == {:controller => "golfers", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/golfers").should == {:controller => "golfers", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/golfers/1").should == {:controller => "golfers", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/golfers/1/edit").should == {:controller => "golfers", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/golfers/1").should == {:controller => "golfers", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/golfers/1").should == {:controller => "golfers", :action => "destroy", :id => "1"}
    end
  end
end
