
class StudentsController < ApplicationController
  include ApplicationHelper
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save

      email_alert

      respond_to do |format|
        ExampleMailer.student_email(@student).deliver!
        format.html { redirect_to (pages_path)}
      end
    else
      render('new')
    end
  end

  private

  def student_params
    params.require(:student).permit(:name,:email)
  end
end



 # @user = User.new(user_params)
 #  respond_to do |format|
 #    if @user.save
 #      # Sends email to user when user is created.
 #      ExampleMailer.sample_email(@user).deliver
 #      format.html { redirect_to @user, notice: 'User was successfully created.' }
 #      format.json { render :show, status: :created, location: @user }
 #    else
 #      format.html { render :new }
 #      format.json { render json: @user.errors, status: :unprocessable_entity }
 #    end
 #  end



