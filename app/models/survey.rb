class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :questions
  has_many :answers, through: :questions

  accepts_nested_attributes_for :questions
  accepts_nested_attributes_for :answers

  validates :title, presence: true
  validates :description, presence: true
end
