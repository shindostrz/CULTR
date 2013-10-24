class Convo < ActiveRecord::Base
  attr_accessible :user_id, :topic, :age, :gender, :description, :latitude, :longitude, :loc_desc, :start_time, :end_time

  has_and_belongs_to_many :users

end
