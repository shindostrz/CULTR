class Category < ActiveRecord::Base
  attr_accessible :cat_name

  has_many :categorizations
  has_many :convos, through: :categorizations
end
