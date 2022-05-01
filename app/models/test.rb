class Test < ApplicationRecord
  def self.sort_by_category(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end
