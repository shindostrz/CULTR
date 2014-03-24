class GenderAssignment < ActiveRecord::Base
  attr_accessible :gender_id, :genderable_id, :genderable_type

  belongs_to :gender
  belongs_to :genderable, polymorphic: true

end
