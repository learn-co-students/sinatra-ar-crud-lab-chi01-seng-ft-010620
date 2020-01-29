
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  post '/articles' do
    Article.create(params)
    redirect "/articles/#{Article.find_by(title: params[:title]).id}"
  end

  patch '/articles/:id' do
    binding.pry
    @article = Article.find_by(id: params[:id])
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    article = Article.find_by(id: params[:id])
    article.destroy
    redirect '/articles'
  end
  
end
