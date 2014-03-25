class GenderAssignment < ActiveRecord::Base
  attr_accessible :gender_id, :genderable_id, :genderable_type, :gender_attributes

  belongs_to :gender
  belongs_to :genderable, polymorphic: true

  accepts_nested_attributes_for :genderable, :gender
end
