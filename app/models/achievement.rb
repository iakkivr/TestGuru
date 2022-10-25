class Achievement < ApplicationRecord
  belongs_to :badge
  belongs_to :user
end

# == Schema Information
#
# Table name: achievements
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  badge_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
