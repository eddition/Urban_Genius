class Song < ActiveRecord::Base
  attr_accessible :id, :title, :artist, :user_id

  has_and_belongs_to_many :words

end