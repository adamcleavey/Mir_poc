class MirrorsController < ApplicationController
  before_action :set_mirror, only: [:show, :edit, :update, :destroy]

  # GET /mirrors
  # GET /mirrors.json
  def index
    @mirrors = Mirror.all
  end

  # GET /mirrors/1
  # GET /mirrors/1.json
  def show
  end

  # GET /mirrors/new
  def new
    @mirror = Mirror.new
  end

  # GET /mirrors/1/edit
  def edit
  end

  # POST /mirrors
  # POST /mirrors.json
  def create
    
    # Dynamically add last_updated and health
    @mirror = Mirror.new(mirror_params)
    @mirror.health = true

    respond_to do |format|
      if @mirror.save
        format.html { redirect_to @mirror, notice: 'Mirror was successfully created.' }
        format.json { render :show, status: :created, location: @mirror }
      else
        format.html { render :new }
        format.json { render json: @mirror.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mirrors/1
  # PATCH/PUT /mirrors/1.json
  def update
    @mirror.last_updated = DateTime.now
    respond_to do |format|
      if @mirror.update(mirror_params)
        format.html { redirect_to @mirror, notice: 'Mirror was successfully updated.' }
        format.json { render :show, status: :ok, location: @mirror }
      else
        format.html { render :edit }
        format.json { render json: @mirror.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mirrors/1
  # DELETE /mirrors/1.json
  def destroy
    @mirror.destroy
    respond_to do |format|
      format.html { redirect_to mirrors_url, notice: 'Mirror was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mirror
      @mirror = Mirror.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mirror_params
      params.require(:mirror).permit(:source, :frequency, :last_updated, :name, :notes, :mirrored_url, :health, :filename, :format)
    end
end
