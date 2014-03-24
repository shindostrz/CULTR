class Gender < ActiveRecord::Base
  attr_accessible :gender_name

  belongs_to :genderable, polymorphic: true
  has_many :gender_assignments
end
