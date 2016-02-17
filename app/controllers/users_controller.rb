class UsersController < ApplicationController
  def index
  end

  def register
  	user = User.create(name: params[:name], alias: params[:alias], email: params[:email], password: params[:password])
  	# if user.errors == nil
  	# 	puts "+_+_+_+_+_+_+_+_+_+_+", user.errors.full_messages, "+_+_+_+_+_+_+_+_+_+_+"
  	# 	redirect_to "/"
  	# else
	  	session[:user_id] = user.id
	  	redirect_to "/ideas/index"
  	# end
  end

  def login
    if User.find_by(email: params[:email]) and User.find_by(password: params[:password]) != nil
      user = User.find_by(email: params[:email])
      session[:user_id] = user.id
      redirect_to "/ideas/index"
    else
      redirect_to "/"
    end
  end

  def logout
  	session.clear
  	redirect_to "/"
  end

  def show
  	@user = User.find(params[:id])
  	@number_of_posts_by_user = @user.ideas.count
  	@number_of_likes_by_user = @user.likes.count
  end

end
