class WordsController < ApplicationController

  def index

    @word = params[:name]
    url = "http://api.urbandictionary.com/v0/define?term=#{@word}"
    response = HTTParty.get(url)
    @definition = response.to_hash["list"][0]["definition"]

    render('show')
  end

  def show
    raise
  end

  def create

    user = User.find(session[:user_id])
    word = params[:word]
    name = word[:name]
    definition = word[:definition]

    if Word.Song.find_or_name_by_definition(name, definition) == false
      Word.create(name: name, definition: definition)
      user.words << Word.last
    end

    @list = @user.words
    render('list')

  end

  def list

  end

end