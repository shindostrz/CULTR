class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :convo
  # attr_accessible :title, :body
end
