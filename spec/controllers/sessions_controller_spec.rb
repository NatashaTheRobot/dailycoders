require 'spec_helper'

describe SessionsController do
  before :each do
    @user = User.create_with_omniauth(OmniAuth.config.mock_auth[:github])
    @user.admin = true
    @user.save!
    @course = FactoryGirl.create :course
    FactoryGirl.create :leadership, user: @user, course: @course
  end

  let(:valid_attributes) { { start_date: Date.today.advance(weeks: 1),
                             end_date: Date.today.advance(weeks: 13),
                             course_id: @course.id  } }
  let(:valid_user_session) { { user_id: @user.id } }

  describe "GET index" do
    it "assigns all sessions as @sessions" do
      session = Session.create! valid_attributes
      FactoryGirl.create :enrollment, user: @user, session: session
      get :index, { course_id: @course.to_param, session_id: session.to_param}, valid_user_session
      assigns(:sessions).should eq([session])
    end
  end

  describe "GET show" do
    it "assigns the requested session as @session" do
      session = Session.create! valid_attributes
      get :show, {course_id: @course.to_param, :id => session.to_param}, valid_user_session
      assigns(:session).should eq(session)
    end
  end

  describe "GET new" do
    it "assigns a new session as @session" do
      get :new, { course_id: @course.to_param }, valid_user_session
      assigns(:session).should be_a_new(Session)
    end
  end

  describe "GET edit" do
    it "assigns the requested session as @session" do
      session = Session.create! valid_attributes
      get :edit, {course_id: @course.to_param, :id => session.to_param}, valid_user_session
      assigns(:session).should eq(session)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Session" do
        expect {
          post :create, {course_id: @course.to_param, :session => valid_attributes}, valid_user_session
        }.to change(Session, :count).by(1)
      end

      it "assigns a newly created session as @session" do
        post :create, {course_id: @course.to_param, :session => valid_attributes}, valid_user_session
        assigns(:session).should be_a(Session)
        assigns(:session).should be_persisted
      end

      it "redirects to the created session" do
        post :create, {course_id: @course.to_param, :session => valid_attributes}, valid_user_session
        response.should redirect_to(course_session_path(@course, Session.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved session as @session" do
        # Trigger the behavior that occurs when invalid params are submitted
        Session.any_instance.stub(:save).and_return(false)
        post :create, {course_id: @course.to_param,
                       :session => { "start_date" => Date.today.advance(weeks: 2).to_s }}, valid_user_session
        assigns(:session).should be_a_new(Session)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Session.any_instance.stub(:save).and_return(false)
        post :create, {course_id: @course.to_param,
                       :session => { "start_date" => Date.today.advance(weeks: 2).to_s }}, valid_user_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested session" do
        session = Session.create! valid_attributes
        Session.any_instance.should_receive(:update).with({ "start_date" => Date.today.advance(weeks: 2).to_s })
        put :update, {course_id: @course.to_param, :id => session.to_param,
                      :session => { "start_date" => Date.today.advance(weeks: 2).to_s }}, valid_user_session
      end

      it "assigns the requested session as @session" do
        session = Session.create! valid_attributes
        put :update, {course_id: @course.to_param, :id => session.to_param, :session => valid_attributes}, valid_user_session
        assigns(:session).should eq(session)
      end

      it "redirects to the session" do
        session = Session.create! valid_attributes
        put :update, {course_id: @course.to_param, :id => session.to_param, :session => valid_attributes}, valid_user_session
        response.should redirect_to(course_session_path(@course, session))
      end
    end

    describe "with invalid params" do
      it "assigns the session as @session" do
        session = Session.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Session.any_instance.stub(:save).and_return(false)
        put :update, {course_id: @course.to_param, :id => session.to_param, :session => { "start_date" => Date.today.advance(weeks: 2).to_s }}, valid_user_session
        assigns(:session).should eq(session)
      end

      it "re-renders the 'edit' template" do
        session = Session.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Session.any_instance.stub(:save).and_return(false)
        put :update, {course_id: @course.to_param, :id => session.to_param, :session => { "start_date" => Date.today.advance(weeks: 2).to_s }}, valid_user_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested session" do
      session = Session.create! valid_attributes
      expect {
        delete :destroy, {course_id: @course.to_param, :id => session.to_param}, valid_user_session
      }.to change(Session, :count).by(-1)
    end

    it "redirects to the sessions list" do
      session = Session.create! valid_attributes
      delete :destroy, {course_id: @course.to_param, :id => session.to_param}, valid_user_session
      response.should redirect_to(course_sessions_path(@course))
    end
  end

end
