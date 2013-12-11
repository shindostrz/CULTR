class Convo < ActiveRecord::Base
  attr_accessible :user_id, :topic, :age, :gender, :description, :latitude, :longitude, :loc_desc, :start_time, :end_time

  has_many :convos_users
  has_many :users, :through => :convos_users

end
