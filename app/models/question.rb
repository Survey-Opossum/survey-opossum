class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question_type
  has_many :options
  has_many :answers
end
