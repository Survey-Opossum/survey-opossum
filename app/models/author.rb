class Author < ActiveRecord::Base
  has_secure_password
  has_many :surveys

  validates :name, presence: :true
  validates :email, presence: :true
  validates :password, presence: :true
  validates :password_confirmation, presence: :true
end
