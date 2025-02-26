class StaticPagesController < ApplicationController
  def home
    
    @limit = Setting.first.initial_posts_count
    offset = params[:offset].to_i || 0

    now = Time.current
    post_within_days = Setting.first.post_within_days
    start_date = now - post_within_days.days

    posts = Post.where('schedule >= ? AND schedule <= ?', start_date, now).order(schedule: :desc)
    
    combined_posts = (posts).sort_by(&:schedule).reverse
    
    @total_posts = combined_posts.count
    @posts = combined_posts.slice(offset, @limit)
    
    respond_to do |format|
      format.html
      format.js
    end

  end

  def employee_information
    user_submitted_form_ids = FormSubmission.where(user: current_user).pluck(:form_id)

    # Forms with submissions by the user
    @forms_with_submission = Form.where(id: user_submitted_form_ids, status: 'active')
    
    # Forms without submissions by the user
    @forms_without_submission = Form.where.not(id: user_submitted_form_ids).where(status: 'active')

  end
end
