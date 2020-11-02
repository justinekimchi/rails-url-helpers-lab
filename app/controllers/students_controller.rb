class StudentsController < ApplicationController
    before_action :set_student, only: %i[show activate]

    def index
        @students = Student.all
    end

    def show
        @student = Student.find_by(id: params[:id])
    end

    def activate
        @student.active = !@student.active
        @student.save
        redirect_to student_path(@student)
    end

    private

    def set_student
        @student = Student.find(params[:id])
    end
end
