class GenderAssignment < ActiveRecord::Base
  attr_accessible :gender_id, :genderable_id, :genderable_type
end
