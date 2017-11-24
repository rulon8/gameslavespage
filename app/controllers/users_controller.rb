class UsersController < ApplicationController
  
  def creaTemp
            @user = User.new
            @user[:username] = "Dratad"
            @user[:password] = "12345"
            @user[:email] = "juanpeeee95@gmail.com"
            @user.save
  end
end
