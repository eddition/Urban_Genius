class WordsController < ApplicationController

  def index

    @word = params[:name]
    url = "http://api.urbandictionary.com/v0/define?term=#{@word}"
    response = HTTParty.get(url)

    if response["result_type"] == "no_results"
      flash[:alert] = "Word not found in Urban Dictionary "
      redirect_to :back
    else
      @definition = response.to_hash["list"][0]["definition"]
      render('show')
    end

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

    user.words.each do |new_word|
      match << new_word.name
    end

    if match.include?(name) == false
      user.words << Word.where(name: name)
    end

    render('list')

  end

  def list

  end

end