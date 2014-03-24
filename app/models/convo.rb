class Convo < ActiveRecord::Base
  attr_accessible :user_id, :topic, :age, :gender, :description, :latitude, :longitude, :loc_desc, :start_time, :end_time

  belongs_to :user
  has_many :users, through: :responses
  has_many :gender_assignments, as: :genderable
  has_many :genders, through: :gender_assignments
  has_many :categories, through: :categorizations

end
