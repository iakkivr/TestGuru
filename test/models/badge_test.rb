# == Schema Information
#
# Table name: badges
#
#  id            :bigint           not null, primary key
#  title         :string           not null
#  url_image     :string           not null
#  option        :string           default("default")
#  badge_rule_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class BadgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
