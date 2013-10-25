class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :age, :gender, :interests, :writers, :works, :quotes, :remember_token
  has_secure_password

  # has_and_belongs_to_many :convos
  has_many :convos, :through => :convos_users

  before_save :create_remember_token

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
