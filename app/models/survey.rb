class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :questions
  has_many :options, through: :questions

  validates :title, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :questions,
    :allow_destroy => :true,
    :reject_if => :all_blank
  accepts_nested_attributes_for :options,
    :allow_destroy => :true,
    :reject_if => proc { |attributes| attributes['name'].blank?}
end
