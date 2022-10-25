class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :url, presence: true

  def url_hash
    URI(url).path[1..]
  end
end

# == Schema Information
#
# Table name: gists
#
#  id          :bigint           not null, primary key
#  url         :string           not null
#  user_id     :integer          not null
#  question_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
