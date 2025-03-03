class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  has_many :form_submissions, dependent: :destroy

  after_create :check_for_admin
  after_update :check_for_admin
  after_destroy :check_for_admin

  def check_for_admin
    admins = User.where(isAdmin: true)
    if admins.count == 0
      user = User.first
      if user.present?
        user.isAdmin = true
        user.save
      end
    end
  end

end