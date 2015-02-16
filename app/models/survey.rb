class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :questions
  has_many :options, through: :questions
  has_many :answers, through: :questions

  validates :title, presence: true


  accepts_nested_attributes_for :questions,
    # :inverse_of => :survey,
    :allow_destroy => :true,
    :reject_if => proc { |attributes| attributes['text'].blank?}
  accepts_nested_attributes_for :options,
    :allow_destroy => :true,
    :reject_if => proc { |attributes| attributes['name'].blank?}
    # :reject_if => proc { |attributes| attributes['order_number'].blank?}

  validate :survey_has_question, on: [:create, :update]

  def survey_has_question
    if self.questions.empty?
      errors.add(:text, "Survey must have one question.")
    end
  end

end
