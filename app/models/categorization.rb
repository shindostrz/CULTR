class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :convo_id

  belongs_to :category
  belongs_to :convo
end
