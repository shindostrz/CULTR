class ConvosUser < ActiveRecord::Base
  attr_accessible :convo_id, :user_id

  belongs_to :user
  belongs_to :convo
end
