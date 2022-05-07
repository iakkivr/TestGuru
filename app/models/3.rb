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
  has_many :users, through: :tests_passages
  has_many :tests_users, dependent: :destroy


  def self.sort_by_category(category)
        Test.joins('JOIN categories ON categories.id = tests.category_id')
          .where(categories: { title: category }).order(title: :desc)
  end
 end

