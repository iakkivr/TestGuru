class BadgesController < ApplicationController
  # GET /badges or /badges.json
  def index
    @badges = Badge.all
  end

  def achievements
    @badges_user = current_user.badges
  end

end
