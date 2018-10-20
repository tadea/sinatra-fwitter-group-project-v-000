class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
     redirect to '/tweets'
   else
     erb :'users/create_user'
   end
 end

 post '/signup' do
     if params[:username] == "" || params[:password] == "" || params[:email] == ""
       redirect to '/signup'
     else
       @user = User.new(username: params[:username], email: params[:email], password: params[:password])
       @user.save
       session[:user_id] = @user.id
       redirect to '/tweets'
     end
 	end
end
