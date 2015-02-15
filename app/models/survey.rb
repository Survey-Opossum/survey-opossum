class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :questions
  has_many :options, through: :questions

  validates :title, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :questions,
    :allow_destroy => :true,
    :reject_if => proc { |attributes| attributes['text'].blank?}
  accepts_nested_attributes_for :options,
    :allow_destroy => :true,
    :reject_if => proc { |attributes| attributes['name'].blank?}
    # :reject_if => proc { |attributes| attributes['order_number'].blank?}

end
