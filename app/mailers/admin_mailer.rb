class AdminMailer < ApplicationMailer
    def new_user_password(admin)
        @admin = admin
        mail to: @admin.email, subject: "Your Login Credentials"
    end

    def new_user_project(project, employee)
    @employee = employee
    @project = project
    mail to: @employee.email, subject: "Your Project Deatils"
    end
end
