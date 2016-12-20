require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do                      # Go to Home
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do             # Go to Add new post page
    erb :new
  end

  post '/posts' do                # Create new post
    attributes = {:name => params[:name], :content => params[:content]}
    @post = Post.create(attributes)
    redirect to '/posts'
  end

  get '/posts' do                 # Go to Home
    @posts = Post.all
    erb :index
  end

  get '/posts/:id/edit' do        # Go to Edit post page
    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  patch '/posts/:id' do            # Update post
    attributes = {:name => params[:name], :content => params[:content]}
    @post = Post.find_by(id: params[:id])
    @post.update(attributes)
    @post.save
    erb :show
  end

  delete '/posts/:id' do          # Delete post
    @post = Post.find_by(id: params[:id])
    @post.destroy
    "#{@post.name} was deleted"
  end

  get '/posts/:id' do             # Go to post page
    @post = Post.find_by(id: params[:id])
    erb :show
  end

end
