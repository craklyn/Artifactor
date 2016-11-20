class StudentsController < ApplicationController

  EDITABLE_PARAMS = [
      :first_name,
      :last_name,
      :email
  ].freeze

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)

    if @student.errors.any?
      render 'students/new'
    else
      redirect_to students_path
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update_attributes(student_params)

    if @student.errors.any?
      render 'students/new'
    else
      redirect_to students_path
    end
  end

  def student_params
    params.require(:student).permit(EDITABLE_PARAMS)
  end
end
