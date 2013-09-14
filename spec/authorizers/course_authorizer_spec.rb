describe CourseAuthorizer do

  before :each do
    @user = FactoryGirl.build :user
    @course = FactoryGirl.create :course
    @session = FactoryGirl.create :session, course: @course
  end

  describe ".creatable_by" do
    it "lets the admin create a course" do
      @user.admin = true
      @user.save!
      expect(CourseAuthorizer).to be_creatable_by(@user)
    end

    it "doesn't let users create a course" do
      expect(CourseAuthorizer).not_to be_creatable_by(@user)
    end
  end

  describe "#readable_by?" do

    it "lets the course admin read the course" do
      FactoryGirl.create :leadership, user: @user, course: @course
      expect(@course).to be_readable_by(@user)
    end

    it "lets an enrolled user to read the course" do
      Enrollment.create(user: @user, session: @session)
      expect(@course).to be_readable_by(@user)
    end

    it "doesn't let non-enrolled non-admin user read the course" do
      expect(@course).not_to be_readable_by(@user)
    end

  end

  describe "#updatable_by?" do

    it "lets the course admins update the course" do
      FactoryGirl.create :leadership, user: @user, course: @course
      expect(@course).to be_updatable_by(@user)
    end

    it "doesn't let non-admins update the course" do
      expect(@course).not_to be_updatable_by(@user)
    end

  end

  describe "deletable_by?" do

    it "lets enrollment admins delete the course" do
      FactoryGirl.create :leadership, user: @user, course: @course
      expect(@course).to be_deletable_by(@user)
    end

    it "doesn't let non-enrollment-admins delete the course" do
      expect(@course).not_to be_deletable_by(@user)
    end
  end

end