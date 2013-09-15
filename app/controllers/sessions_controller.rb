class SessionsController < ApplicationController
  before_action :set_course
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  # GET /courses/:course_id/sessions
  def index
    @sessions = current_user.sessions
  end

  # GET /courses/:course_id/sessions/:id
  def show
  end

  # GET /courses/:course_id/sessions/new
  def new
    @session = Session.new
    @session.course = @course
    authorize_action_for(@session)
  end

  # GET /courses/:course_id/sessions/:id/edit
  def edit
  end

  # POST /courses/:course_id/sessions
  def create
    @session = Session.new(session_params)
    @session.course = @course
    authorize_action_for(@session)

    if @session.save
      Enrollment.create(user: current_user, session: @session)
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

    def set_course
      @course = Course.friendly.find(params[:course_id])
    end

    def set_session
      @session = Session.friendly.find(params[:id])
      authorize_action_for(@session)
    end

    def session_params
      params.require(:session).permit(:start_date, :end_date, :course_id)
    end
end
