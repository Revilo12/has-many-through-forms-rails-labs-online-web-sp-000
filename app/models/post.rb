class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments, :reject_if => :reject_comment

  def reject_comment(attributed)
    attributed['content'].blank?
  end

  def category_name=(name)
     self.category = Category.find_or_create_by(name: name)
  end


end
