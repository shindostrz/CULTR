class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :age, :interests, :writers, :works, :quotes, :remember_token, :genderable_attributes, :gender_attributes, :gender_assignment_attributes
  has_secure_password

  has_many :convos
  has_one :gender_assignment, as: :genderable
  has_one :gender, through: :gender_assignment

  accepts_nested_attributes_for :gender, :gender_assignment

  before_save :create_remember_token

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
