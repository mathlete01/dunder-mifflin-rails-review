class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def edit
        @employee = Employee.find(params[:id])
        @dog = @employee.dog
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office))
        if @employee.save!
            redirect_to employee_path(employee)
        else
            render :new
        end
    end

    def update
        @employee = Employee.new(params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office))
        if @employee.save!
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end

end
