class TypeOfMeetingsController < ApplicationController
  before_action :set_type_of_meeting, only: [:show, :edit, :update, :destroy]

  # GET /type_of_meetings
  # GET /type_of_meetings.json
  def index
    @type_of_meetings = TypeOfMeeting.all
  end

  # GET /type_of_meetings/1
  # GET /type_of_meetings/1.json
  def show
  end

  # GET /type_of_meetings/new
  def new
    @type_of_meeting = TypeOfMeeting.new
  end

  # GET /type_of_meetings/1/edit
  def edit
    @title_obtaineds = TitleObtained.all
  end

  # POST /type_of_meetings
  # POST /type_of_meetings.json
  def create
    @type_of_meeting = TypeOfMeeting.new(type_of_meeting_params)

    respond_to do |format|
      if @type_of_meeting.save
        format.html { redirect_to @type_of_meeting, notice: 'Type of meeting was successfully created.' }
        format.json { render :show, status: :created, location: @type_of_meeting }
      else
        format.html { render :new }
        format.json { render json: @type_of_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_meetings/1
  # PATCH/PUT /type_of_meetings/1.json
  def update
    p params
    respond_to do |format|
      if @type_of_meeting.update(type_of_meeting_params)
        format.html { redirect_to @type_of_meeting, notice: 'Type of meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_of_meeting }
      else
        format.html { render :edit }
        format.json { render json: @type_of_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_meetings/1
  # DELETE /type_of_meetings/1.json
  def destroy
    @type_of_meeting.destroy
    respond_to do |format|
      format.html { redirect_to type_of_meetings_url, notice: 'Type of meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_meeting
      @type_of_meeting = TypeOfMeeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_of_meeting_params
      params.require(:type_of_meeting).permit(:name, :description, :code,
                                              pre_attendance_meetings_attributes: [
                                                  :id,
                                                  :title_obtained_id,
                                                  :_destroy
                                              ]
      )
    end
end
