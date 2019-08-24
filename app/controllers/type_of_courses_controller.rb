class TypeOfCoursesController < ApplicationController
  before_action :set_type_of_course, only: [:show, :edit, :update, :destroy]

  # GET /type_of_courses
  # GET /type_of_courses.json
  def index
    @type_of_courses = TypeOfCourse.all
  end

  # GET /type_of_courses/1
  # GET /type_of_courses/1.json
  def show
  end

  # GET /type_of_courses/new
  def new
    @type_of_course = TypeOfCourse.new
  end

  # GET /type_of_courses/1/edit
  def edit
  end

  # POST /type_of_courses
  # POST /type_of_courses.json
  def create
    @type_of_course = TypeOfCourse.new(type_of_course_params)

    respond_to do |format|
      if @type_of_course.save
        format.html { redirect_to @type_of_course, notice: 'Type of course was successfully created.' }
        format.json { render :show, status: :created, location: @type_of_course }
      else
        format.html { render :new }
        format.json { render json: @type_of_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_courses/1
  # PATCH/PUT /type_of_courses/1.json
  def update
    respond_to do |format|
      if @type_of_course.update(type_of_course_params)
        format.html { redirect_to @type_of_course, notice: 'Type of course was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_of_course }
      else
        format.html { render :edit }
        format.json { render json: @type_of_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_courses/1
  # DELETE /type_of_courses/1.json
  def destroy
    @type_of_course.destroy
    respond_to do |format|
      format.html { redirect_to type_of_courses_url, notice: 'Type of course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_course
      @type_of_course = TypeOfCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_of_course_params
      params.require(:type_of_course).permit(:name, :description, :code)
    end
end
