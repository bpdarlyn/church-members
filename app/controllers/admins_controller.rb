class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html {redirect_to @admin, notice: 'Admin was successfully created.'}
        format.json {render :show, status: :created, location: @admin}
      else
        format.html {render :new}
        format.json {render json: @admin.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html {redirect_to @admin, notice: 'Admin was successfully updated.'}
        format.json {render :show, status: :ok, location: @admin}
      else
        format.html {render :edit}
        format.json {render json: @admin.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html {redirect_to admins_url, notice: 'Admin was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def generate_meeting_report
    @attendance_people = []
    @type_of_meeting = TypeOfMeeting.find_by_code(params[:type_of_meeting_code])
    @header_attendance_meeting = HeaderAttendanceMeeting.new
    @people = Person.all.joins(:meetings).where(meetings: {type_of_meeting_id: @type_of_meeting.id})
    @meetings = Meeting.all.where(type_of_meeting: @type_of_meeting)
  end

  def upload_meeting_report
    @attendance_people = []
    @type_of_meeting = TypeOfMeeting.find_by_code(params[:type_of_meeting_code])
    @header_attendance_meeting = HeaderAttendanceMeeting.new(header_attendance_params)
    @person = Person.find(params[:person_id]) if params[:person_id].presence
    @meetings = Meeting.all.where(type_of_meeting: @type_of_meeting)
    @people = Person.all.joins(:meetings).where(meetings: {type_of_meeting_id: @type_of_meeting.id})
    if @header_attendance_meeting.meeting_id and @person
      if params[:attendances].present?
        params[:attendances].each do |k, v|
          person_attendance_meeting = @header_attendance_meeting.person_attendance_meetings.build
          person_attendance_meeting.person_id = k
          person_attendance_meeting.attended = true
        end
      end
      @meeting = Meeting.find(@header_attendance_meeting.meeting_id)
      @attendance_people = Person.possible_attendances_to_meeting?(@meeting, @person).order(created_at: :desc)
    end
    respond_to do |format|
      if @header_attendance_meeting.save
        format.html {redirect_to root_path, notice: 'Uploaded new meeting report'}
      else
        format.html {
          render :generate_meeting_report
        }
      end
    end
  end

  def on_change_select_person
    @person = Person.find(params[:person_id])
    @type_of_meeting = TypeOfMeeting.find_by_code(params[:type_of_meeting_code])
    @meetings = @person.meetings.where(type_of_meeting: @type_of_meeting)
    @header_attendance_meeting = HeaderAttendanceMeeting.new
    respond_to do |format|
      format.js
    end
  end

  def on_change_select_meeting
    @header_attendance_meeting = HeaderAttendanceMeeting.new
    @meeting = Meeting.find(params[:meeting_id])
    @person_leader = Person.find(params[:person_id])
    @attendance_people = Person.possible_attendances_to_meeting?(@meeting, @person_leader).order(:created_at)
    respond_to do |format|
      format.json
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  def header_attendance_params
    params.require(:header_attendance_meeting)
        .permit(:id, :topic, :attendance_date, :offerings, :prayer, :meeting_id, :total_attendees)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.require(:admin).permit(:token, :code)
  end
end
