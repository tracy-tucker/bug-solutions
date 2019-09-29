class UsersController < ApplicationController

  # GET: /login
  get '/login' do
    if logged_in?
      redirect :'/products'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect :'/products'
      else
        redirect :'/login'
      end
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect :'/products'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect :'/signup'
    else
      @user = User.create(params)
      session[:user_id] = @user.id #:user_id is a session key. @user.id is assigning the session key to the user's id that is in session.

      redirect :'/products'
    end
  end

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
