class Word < ActiveRecord::Base
  attr_accessible :name, :definition

  has_and_belongs_to_many :songs
  has_and_belongs_to_many :users
end