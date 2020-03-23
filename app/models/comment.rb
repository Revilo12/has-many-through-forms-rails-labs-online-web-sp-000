class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def user_attributes=(user_attribute)
    if !user_attribute[:username].blank?
      user = User.find_or_create_by(username: user_attribute[:username])
      self.user= user
      self.save
    end
  end
end
