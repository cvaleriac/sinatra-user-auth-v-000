class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
<<<<<<< HEAD
    session[:id] = @user.id
=======

    session[:id] = @user.id

>>>>>>> 7d3ac6d38d2b6822995b5b2bec323d23405db0d9
    redirect '/users/home'
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    @user = User.find_by(email: params["email"], password: params["password"])
<<<<<<< HEAD
    if !@user
      redirect '/sessions/login'
    else
=======
>>>>>>> 7d3ac6d38d2b6822995b5b2bec323d23405db0d9
    session[:id] = @user.id
    redirect '/users/home'
    end
  end

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end

  get '/users/home' do
    @user = User.find(session[:id])
    erb :'/users/home'
  end

end
