class PeopleController < ApplicationController
  # before_action :set_person, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  #region actions with views
  def index
    @title_breadcrum = "Persona"
    if params[:filter_code]
      @title_obtained = TitleObtained.find_by_code(params[:filter_code])
      if @title_obtained
        @people = @people.joins(my_titles: :title_obtained)
                      .where("title_obtaineds.code = ? and my_titles.active = true", params[:filter_code])
      end
    end

    if current_user.is?(:churchman)
      @people = @people.where(person_id: current_user.person.id)
    end

  end

  def new
    TitleObtained.all.each do |title_obtained|
      title = @person.my_titles.build
      title.title_obtained = title_obtained
    end
    @people = Person.all
  end

  def edit
    @people = Person.all
    unless @person.my_titles.any?
      TitleObtained.all.each do |title_obtained|
        title = @person.my_titles.build
        title.title_obtained = title_obtained
        title.save
      end
    end
  end

  #endregion

  #region logical actions
  def create
    @people = Person.all
    @person = Person.new(person_params)
    TitleObtained.all.each do |title_obtained|
      new_title = @person.my_titles.build
      new_title.title_obtained = title_obtained
      new_title.active = params[:title_obtained_id].to_i === title_obtained.id
      new_title.title_date = Date.today
    end

    respond_to do |format|
      if @person.save
        format.html {redirect_to people_path, notice: 'Person was successfully created.'}
        format.js {
          render(json: [{person_model: @person}])}
      else
        format.js
        format.html {render :new}
      end
    end
  end

  def update
    @person.my_titles.where(active: true).update_all(active: false)
    active_new_title = @person.my_titles.where(title_obtained_id: params[:title_obtained_id]).first
    active_new_title ||= @person.my_titles.build
    active_new_title.title_date = Date.today
    active_new_title.active = true
    active_new_title.save
    respond_to do |format|
      if @person.update(person_params)
        format.html {redirect_to people_path, notice: 'Person was successfully updated.'}
      else
        @people = Person.all
        format.html {render :edit}
      end
    end
  end

  def destroy;
  end

  def generate_meeting_report
    # @type_of_meeting = TypeOfMeeting.find_by_code(params[:type_of_meeting_code])
    # @meeting = current_user.person.meetings.where(type_of_meeting_id: @type_of_meeting.id).first
    @header_attendance_meeting = HeaderAttendanceMeeting.new
    @people = Person.all
    @meetings = []
  end

  def upload_meeting_report

  end

  def new_express
    @person = Person.new
    TitleObtained.all.each do |title_obtained|
      title = @person.my_titles.build
      title.title_obtained = title_obtained
    end
    @people = Person.all

    respond_to do |format|
      format.js
    end
  end

  def generate_meeting_report
    @attendance_people = []
    @type_of_meeting = TypeOfMeeting.find_by_code(params[:type_of_meeting_code])
    @meeting = current_user.person.meetings.where(type_of_meeting: @type_of_meeting, active: true).first
    @header_attendance_meeting = HeaderAttendanceMeeting.new(meeting: @meeting)
    @attendance_people = Person.possible_attendances_to_meeting?(@meeting, current_user.person).order(created_at: :desc)
  end

  def upload_meeting_report
    @attendance_people = []
    @type_of_meeting = TypeOfMeeting.find_by_code(params[:type_of_meeting_code])
    @header_attendance_meeting = HeaderAttendanceMeeting.new(header_attendance_params)
    @person = current_user.person
    @meeting = Meeting.find(@header_attendance_meeting.meeting_id)
    @attendance_people = Person.possible_attendances_to_meeting?(@meeting, @person).order(created_at: :desc)
    if @header_attendance_meeting.meeting_id and @person
      if params[:attendances].present?
        params[:attendances].each do |k, v|
          person_attendance_meeting = @header_attendance_meeting.person_attendance_meetings.build
          person_attendance_meeting.person_id = k
          person_attendance_meeting.attended = true
        end
      end
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

  #endregion

  private

  def header_attendance_params
    params.require(:header_attendance_meeting)
        .permit(:id, :topic, :attendance_date, :offerings, :prayer, :meeting_id, :total_attendees)
  end

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params_with_leader = params.require(:person)
                             .permit(:name, :last_name, :address, :birthday, :phone_number, :ci, :sex, :person_id)
    unless current_user.is?(:admin)
      params_with_leader = params_with_leader.merge({person_id: current_user.person_id})
    end
    params_with_leader

  end

end
