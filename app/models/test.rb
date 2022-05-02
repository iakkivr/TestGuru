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
        Test.joins(:categories)
          .where(categories: { title: category }).order(title: :desc)
  end
