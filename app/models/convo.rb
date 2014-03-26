class Convo < ActiveRecord::Base
  attr_accessible :user_id, :age, :description, :latitude, :longitude, :loc_desc, :start_time, :end_time,
                          :genders_attributes, :categories_attributes, :category_ids, :gender_ids
# Necessary to include the _attributes?

  belongs_to :user
  has_many :users, through: :responses
  has_many :gender_assignments, as: :genderable
  has_many :genders, through: :gender_assignments
  has_many :categorizations
  has_many :categories, through: :categorizations

end
