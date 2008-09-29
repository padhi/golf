class GolfersController < ApplicationController
  # GET /golfers
  # GET /golfers.xml
  def index
    @golfers = Golfer.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @golfers }
    end
  end

  # GET /golfers/1
  # GET /golfers/1.xml
  def show
    @golfer = Golfer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @golfer }
    end
  end

  # GET /golfers/new
  # GET /golfers/new.xml
  def new
    @golfer = Golfer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @golfer }
    end
  end

  # GET /golfers/1/edit
  def edit
    @golfer = Golfer.find(params[:id])
  end

  # POST /golfers
  # POST /golfers.xml
  def create
    @golfer = Golfer.new(params[:golfer])

    respond_to do |format|
      if @golfer.save
        flash[:notice] = 'Golfer was successfully created.'
        format.html { redirect_to(@golfer) }
        format.xml  { render :xml => @golfer, :status => :created, :location => @golfer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @golfer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /golfers/1
  # PUT /golfers/1.xml
  def update
    @golfer = Golfer.find(params[:id])

    respond_to do |format|
      if @golfer.update_attributes(params[:golfer])
        flash[:notice] = 'Golfer was successfully updated.'
        format.html { redirect_to(@golfer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @golfer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /golfers/1
  # DELETE /golfers/1.xml
  def destroy
    @golfer = Golfer.find(params[:id])
    @golfer.destroy

    respond_to do |format|
      format.html { redirect_to(golfers_url) }
      format.xml  { head :ok }
    end
  end
end
