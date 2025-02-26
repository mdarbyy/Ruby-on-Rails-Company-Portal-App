class FormSubmission < ApplicationRecord
  belongs_to :form
  belongs_to :user

  validates :answers, presence: true
end
