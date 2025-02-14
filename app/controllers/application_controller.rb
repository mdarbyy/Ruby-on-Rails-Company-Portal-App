class ApplicationController < ActionController::Base
  add_flash_types :success, :danger
  before_action :authenticate_user!
  before_action :ensure_setting_exists

  private

  def ensure_setting_exists
    Setting.first_or_create
  end
end