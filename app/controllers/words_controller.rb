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
    Word.find_or_create_by_name_and_definition(name, definition)
    match = []
    user.words.each do |word|
       match << word.name
    end
    if match.include?(name) == false
      user.words << Word.where(name: name)
    end
    # @list = user.words
    render('list')

  end

  def list

  end

end