class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :age, :interests, :writers, :works, :quotes, :remember_token,
                          :gender_attributes
  has_secure_password

  has_many :convos
  has_one :gender_assignment, as: :genderable
  has_one :gender, through: :gender_assignment

  accepts_nested_attributes_for :gender

  before_save :create_remember_token

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
