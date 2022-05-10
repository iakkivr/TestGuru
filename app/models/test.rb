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


  scope :easy, -> { where level: 0..1 }
  scope :middle, -> { where level: 2..4 }
  scope :hard, -> { where level: 4..Float::INFINITY }
  scope :sort_by_category, -> (category_title) {
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  }

 end
