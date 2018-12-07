class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to my awesome site')
    end

    def forget_password(user)
        @user = user
        mail(to: @user.email, subject: "Forget Password akun #{user.name}")
    end
end
