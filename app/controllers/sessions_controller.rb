class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]
  before_action :set_course

  # GET /courses/:course_id/sessions
  def index
    @sessions = Session.all
  end

  # GET /courses/:course_id/sessions/:id
  def show
  end

  # GET /courses/:course_id/sessions/new
  def new
    @session = Session.new
  end

  # GET /courses/:course_id/sessions/:id/edit
  def edit
  end

  # POST /courses/:course_id/sessions
  def create
    @session = Session.new(session_params)

    if @session.save
      redirect_to course_session_path(@course, @session), notice: 'Session was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /courses/:course_id/sessions/:id
  def update
    if @session.update(session_params)
      redirect_to course_session_path(@course, @session), notice: 'Session was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE courses/:course_id/sessions/:id
  def destroy
    @session.destroy
    redirect_to course_sessions_path(@course), notice: 'Session was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.friendly.find(params[:id])
      @course = @session.course
    end

    def set_course
      @course = Course.friendly.find(params[:course_id])
    end

    # Only allow a trusted parameter "white list" through.
    def session_params
      params.require(:session).permit(:start_date, :end_date, :course_id)
    end
end
