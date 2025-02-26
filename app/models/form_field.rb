class FormField < ApplicationRecord
  belongs_to :form

  validates :label, :field_type, presence: true
end
