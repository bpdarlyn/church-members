class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
    @type_of_courses = TypeOfCourse.all
  end

  def create
    @type_of_courses = TypeOfCourse.all
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'course was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @type_of_courses = TypeOfCourse.all
  end

  def update
    @type_of_courses = TypeOfCourse.all
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'course was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:id,:start_date,:end_date,
                                   :name,
                                   :type_of_course_id,
                                   :total_attendes,:total_people_inscription,
                                   :pre_enrollment,:end_enrollment,
                                   :min_people, :max_people,
                                   :amount_by_person,:attendance_control)
  end
end
