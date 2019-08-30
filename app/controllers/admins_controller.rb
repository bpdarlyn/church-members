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
    @type_of_meeting = TypeOfMeeting.find_by_code(params[:type_of_meeting_code])
    @header_attendance_meeting = HeaderAttendanceMeeting.new
    @people = Person.all.joins(:meetings).where(meetings:{type_of_meeting_id: @type_of_meeting.id})
    @meetings = Meeting.all.where(type_of_meeting: @type_of_meeting)
  end

  def upload_meeting_report

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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.require(:admin).permit(:token, :code)
  end
end
