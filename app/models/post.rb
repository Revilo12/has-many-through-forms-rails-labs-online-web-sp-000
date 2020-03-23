class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments

  def reject_category(attributed)
    attributed['name'].blank?
  end

  def category_name=(name)
     self.category = Category.find_or_create_by(name: name)
  end

  def categories_attributes=(categories_attributes)
    categories_attributes.each do |category_attribute|
      binding.pry
    end
  end


end
