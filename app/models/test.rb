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
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: "author_id"

  has_many :questions, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :test_passages, dependent: :destroy

  def self.sort_by_category(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
 end
