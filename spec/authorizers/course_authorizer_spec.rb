describe CourseAuthorizer do

  before :each do
    @user = FactoryGirl.build :user
    @course = FactoryGirl.create :course
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

    it "lets an enrolled user to read the course" do
      Enrollment.create(user: @user, course: @course)
      expect(@course).to be_readable_by(@user)
    end

    it "doesn't let non-enrolled user read the course" do
      expect(@course).not_to be_readable_by(@user)
    end

  end

  describe "#updatable_by?" do
    before do
      @enrollment = Enrollment.create(user: @user, course: @course)
    end

    it "lets enrollment admins update the course" do
      @enrollment.admin = true
      @enrollment.save!
      expect(@course).to be_updatable_by(@user)
    end

    it "doesn't let non-enrollment-admins update the course" do
      expect(@course).not_to be_updatable_by(@user)
    end

  end

  describe "deletable_by?" do
    before do
      @enrollment = Enrollment.create(user: @user, course: @course)
    end

    it "lets enrollment admins delete the course" do
      @enrollment.admin = true
      @enrollment.save!
      expect(@course).to be_deletable_by(@user)
    end

    it "doesn't let non-enrollment-admins delete the course" do
      expect(@course).not_to be_deletable_by(@user)
    end
  end

end