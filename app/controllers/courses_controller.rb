class CoursesController < ApplicationController

  before_action :set_course, only: [:show, :edit, :update, :destroy]
  authorize_actions_for Course, only: [:new, :create]

  # GET /courses
  def index
    @courses = current_user.courses
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = Course.new(course_params)
    enrollment = Enrollment.new( course: @course, user: current_user, admin: true )
    @course.enrollments = [enrollment]

    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.friendly.find(params[:id].to_s.downcase)
      authorize_action_for(@course)
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:name, :start_date, :end_date)
    end
end
