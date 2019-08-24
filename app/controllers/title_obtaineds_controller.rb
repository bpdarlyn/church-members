class TitleObtainedsController < ApplicationController
  before_action :set_title_obtained, only: [:show, :edit, :update, :destroy]

  # GET /title_obtaineds
  # GET /title_obtaineds.json
  def index
    @title_obtaineds = TitleObtained.all
  end

  # GET /title_obtaineds/1
  # GET /title_obtaineds/1.json
  def show
  end

  # GET /title_obtaineds/new
  def new
    @title_obtained = TitleObtained.new
  end

  # GET /title_obtaineds/1/edit
  def edit
  end

  # POST /title_obtaineds
  # POST /title_obtaineds.json
  def create
    @title_obtained = TitleObtained.new(title_obtained_params)

    respond_to do |format|
      if @title_obtained.save
        format.html { redirect_to @title_obtained, notice: 'Title obtained was successfully created.' }
        format.json { render :show, status: :created, location: @title_obtained }
      else
        format.html { render :new }
        format.json { render json: @title_obtained.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /title_obtaineds/1
  # PATCH/PUT /title_obtaineds/1.json
  def update
    respond_to do |format|
      if @title_obtained.update(title_obtained_params)
        format.html { redirect_to @title_obtained, notice: 'Title obtained was successfully updated.' }
        format.json { render :show, status: :ok, location: @title_obtained }
      else
        format.html { render :edit }
        format.json { render json: @title_obtained.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /title_obtaineds/1
  # DELETE /title_obtaineds/1.json
  def destroy
    @title_obtained.destroy
    respond_to do |format|
      format.html { redirect_to title_obtaineds_url, notice: 'Title obtained was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_title_obtained
      @title_obtained = TitleObtained.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def title_obtained_params
      params.require(:title_obtained).permit(:title_type, :name)
    end
end
