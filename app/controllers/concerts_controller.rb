class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show, :edit, :update, :destroy]

  # GET /concerts
  # GET /concerts.json
  def index
    if current_user
      @concerts = Concert.all
      system('say woah!')
    else
      render 'unauthorized'
    end
  end

  # GET /concerts/1
  # GET /concerts/1.json
  def show
  end

  # GET /concerts/new
  def new
    @concert = Concert.new
  end

  # GET /concerts/1/edit
  def edit
  end

  # POST /concerts
  # POST /concerts.json
  def create
    @concert = Concert.new
    @concert.name = concert_params[:name]
    @concert.pictureurl = concert_params[:pictureurl]

    dateHash = params[:date]
    @concert.day = DateTime.new(dateHash[:year].to_i, dateHash[:month].to_i, dateHash[:day].to_i)

    respond_to do |format|
      if @concert.save
        format.html { redirect_to @concert, notice: 'Concert was successfully created.' }
        format.json { render :show, status: :created, location: @concert }
      else
        format.html { render :new }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concerts/1
  # PATCH/PUT /concerts/1.json
  def update
    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to @concert, notice: 'Concert was successfully updated.' }
        format.json { render :show, status: :ok, location: @concert }
      else
        format.html { render :edit }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.json
  def destroy
    @concert.destroy
    respond_to do |format|
      format.html { redirect_to concerts_url, notice: 'Concert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concert_params
      params[:concert]
    end

    def check_if_logged
      
    end
end
