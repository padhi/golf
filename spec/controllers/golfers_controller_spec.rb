require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GolfersController do

  def mock_golfer(stubs={})
    @mock_golfer ||= mock_model(Golfer, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all golfers as @golfers" do
      Golfer.should_receive(:find).with(:all).and_return([mock_golfer])
      get :index
      assigns[:golfers].should == [mock_golfer]
    end

    describe "with mime type of xml" do
  
      it "should render all golfers as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Golfer.should_receive(:find).with(:all).and_return(golfers = mock("Array of Golfers"))
        golfers.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested golfer as @golfer" do
      Golfer.should_receive(:find).with("37").and_return(mock_golfer)
      get :show, :id => "37"
      assigns[:golfer].should equal(mock_golfer)
    end
    
    describe "with mime type of xml" do

      it "should render the requested golfer as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Golfer.should_receive(:find).with("37").and_return(mock_golfer)
        mock_golfer.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new golfer as @golfer" do
      Golfer.should_receive(:new).and_return(mock_golfer)
      get :new
      assigns[:golfer].should equal(mock_golfer)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested golfer as @golfer" do
      Golfer.should_receive(:find).with("37").and_return(mock_golfer)
      get :edit, :id => "37"
      assigns[:golfer].should equal(mock_golfer)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created golfer as @golfer" do
        Golfer.should_receive(:new).with({'these' => 'params'}).and_return(mock_golfer(:save => true))
        post :create, :golfer => {:these => 'params'}
        assigns(:golfer).should equal(mock_golfer)
      end

      it "should redirect to the created golfer" do
        Golfer.stub!(:new).and_return(mock_golfer(:save => true))
        post :create, :golfer => {}
        response.should redirect_to(golfer_url(mock_golfer))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved golfer as @golfer" do
        Golfer.stub!(:new).with({'these' => 'params'}).and_return(mock_golfer(:save => false))
        post :create, :golfer => {:these => 'params'}
        assigns(:golfer).should equal(mock_golfer)
      end

      it "should re-render the 'new' template" do
        Golfer.stub!(:new).and_return(mock_golfer(:save => false))
        post :create, :golfer => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested golfer" do
        Golfer.should_receive(:find).with("37").and_return(mock_golfer)
        mock_golfer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :golfer => {:these => 'params'}
      end

      it "should expose the requested golfer as @golfer" do
        Golfer.stub!(:find).and_return(mock_golfer(:update_attributes => true))
        put :update, :id => "1"
        assigns(:golfer).should equal(mock_golfer)
      end

      it "should redirect to the golfer" do
        Golfer.stub!(:find).and_return(mock_golfer(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(golfer_url(mock_golfer))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested golfer" do
        Golfer.should_receive(:find).with("37").and_return(mock_golfer)
        mock_golfer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :golfer => {:these => 'params'}
      end

      it "should expose the golfer as @golfer" do
        Golfer.stub!(:find).and_return(mock_golfer(:update_attributes => false))
        put :update, :id => "1"
        assigns(:golfer).should equal(mock_golfer)
      end

      it "should re-render the 'edit' template" do
        Golfer.stub!(:find).and_return(mock_golfer(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested golfer" do
      Golfer.should_receive(:find).with("37").and_return(mock_golfer)
      mock_golfer.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the golfers list" do
      Golfer.stub!(:find).and_return(mock_golfer(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(golfers_url)
    end

  end

end
