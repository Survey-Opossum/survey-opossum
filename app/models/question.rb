class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question_type
  has_many :options
  has_many :answers


  validates :text, presence: true
  validates :description, presence: true
  validates :order_number, presence: true
end
