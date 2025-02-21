class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  #has_many_attached :files

  before_create :set_schedule
  before_update :set_schedule

  def formatted_schedule
    schedule.strftime('%m/%d/%Y %H:%M') if schedule.present?
  end

  private

  def set_schedule
    self.schedule ||= Time.current.change(sec: 0)
  end
end