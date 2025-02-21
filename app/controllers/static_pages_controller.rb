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
end
