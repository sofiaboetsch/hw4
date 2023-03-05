class SessionsController < ApplicationController
  def new
  end

  #check if the user exist and if they have the correct pas
 def create
  @user = User.find_by({ "email" => params["email"] })
  if @user
    if BCrypt::Password.new(@user["password"]) == params["password"]
      session["user_id"] = @user["id"]
      flash["notice"] = "You've logged in."
      redirect_to "/places"
    else
      flash["notice"] = "Unsuccesfull login."
      redirect_to "/sessions/new"
    end
  else
    flash["notice"] = "Unsuccesfull login."
    redirect_to "/sessions/new"
  end
end

  def destroy
    session["user_id"]=nil
    redirect_to "/sessions/new"
  end
end
  