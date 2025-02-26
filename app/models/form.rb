class Form < ApplicationRecord
  has_many :form_fields, dependent: :destroy
  has_many :form_submissions, dependent: :destroy

  validates :name, presence: true
  validates :status, inclusion: { in: ['active', 'inactive'] }
  validates :required_by, presence: true

  accepts_nested_attributes_for :form_fields, allow_destroy: true
end
