class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def comment_user_attributes=(comment_user_attribute)
    binding.pry
    if !comment_user_attribute[:username].blank?
      user = User.find_or_create_by(username: comment_user_attribute[:username])
      comment.user= user
    end
  end
end
