module ApplicationHelper
  def remove_attachment_path(post, file_id)
    case post
    when Post
      remove_attachment_post_path(post, file_id: file_id)
    end
  end
end
