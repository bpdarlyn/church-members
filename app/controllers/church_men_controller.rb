class ChurchMenController < ApplicationController
  before_action :set_church_man, only: [:show, :edit, :update, :destroy]

  # GET /church_men
  # GET /church_men.json
  def index
    @church_men = ChurchMan.all
  end

  # GET /church_men/1
  # GET /church_men/1.json
  def show
  end

  # GET /church_men/new
  def new
    @church_man = ChurchMan.new
  end

  # GET /church_men/1/edit
  def edit
  end

  # POST /church_men
  # POST /church_men.json
  def create
    @church_man = ChurchMan.new(church_man_params)

    respond_to do |format|
      if @church_man.save
        format.html { redirect_to @church_man, notice: 'Church man was successfully created.' }
        format.json { render :show, status: :created, location: @church_man }
      else
        format.html { render :new }
        format.json { render json: @church_man.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /church_men/1
  # PATCH/PUT /church_men/1.json
  def update
    respond_to do |format|
      if @church_man.update(church_man_params)
        format.html { redirect_to @church_man, notice: 'Church man was successfully updated.' }
        format.json { render :show, status: :ok, location: @church_man }
      else
        format.html { render :edit }
        format.json { render json: @church_man.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /church_men/1
  # DELETE /church_men/1.json
  def destroy
    @church_man.destroy
    respond_to do |format|
      format.html { redirect_to church_men_url, notice: 'Church man was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_church_man
      @church_man = ChurchMan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def church_man_params
      params.require(:church_man).permit(:token)
    end
end
