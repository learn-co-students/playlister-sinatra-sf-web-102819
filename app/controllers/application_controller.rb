class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/artists' do
    @artists = Artist.all
    erb :"/artists/index"
  end

  get '/genres' do
    @genres = Genre.all
    erb :"/genres/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"/songs/new"
  end

  post '/songs' do
    binding.pry
      artist = Artist.find_or_create_by("name"=> params["Artist Name"])
      song = Song.create("name" => params[:Name], "artist_id" => artist.id)
      redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.all.find do |song|
      song.slug == params[:slug]
    end
    erb :"/songs/show"
  end

  get '/artists/:slug' do
    @artist = Artist.all.find do |artist|
      artist.slug == params[:slug]
    end
    erb :"/artists/show"
  end

  get '/genres/:slug' do
    @genre = Genre.all.find do |genre|
      genre.slug == params[:slug]
    end
    erb :"/genres/show"
  end

end