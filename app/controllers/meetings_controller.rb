class MeetingsController < ApplicationController
  # before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
    @people = Person.all
    @type_of_meetings = TypeOfMeeting.all
    @meeting.build_location
  end

  def create
    @people = Person.all
    @type_of_meetings = TypeOfMeeting.all
    @meeting = Meeting.new(meeting_params)
    respond_to do |format|
      if @meeting.save
        format.html {redirect_to meetings_path, notice: 'Meeting was successfully created.'}
      else
        unless @meeting.location
          @meeting.build_location
        end
        format.html {render :new}
      end
    end
  end

  def edit
    @people = Person.all
    @type_of_meetings = TypeOfMeeting.all
    unless @meeting.location
      @meeting.build_location
    end
  end

  def update
    @people = Person.all
    @type_of_meetings = TypeOfMeeting.all
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html {redirect_to meetings_path, notice: 'Meeting was successfully edited.'}
      else
        unless @meeting.location
          @meeting.build_location
        end
        format.html {render :edit}
      end
    end
  end

  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html {redirect_to meetings_path, notice: 'Meeting was successfully destroyed.'}
    end
  end


  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:code, :start_date_time,
                                    :end_date_time, :active, :type_of_meeting_id,
                                    :person_id, :name, :description,
                                    :attendance_control,
                                    location_attributes: [:custom_address, :lat, :lng, :place_id, :address]
    )
  end
end
