class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :questions

  accepts_nested_attributes_for :questions

  validates :title, presence: true
  validates :description, presence: true
end
