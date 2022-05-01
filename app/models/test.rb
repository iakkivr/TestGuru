# == Schema Information
#
# Table name: tests
#
#  id          :integer          not null, primary key
#  title       :string(50)       not null
#  level       :integer          default(0), not null
#  category_id :integer          not null
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Test < ApplicationRecord
  def self.sort_by_category(category)
    category_id = Category.where(title: category).take&.id
    Test.where(category_id: category_id).order(title: :desc).pluck(:title)
  end
end
