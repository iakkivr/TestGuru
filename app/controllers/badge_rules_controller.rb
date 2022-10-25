class BadgeRulesController < ApplicationController
  def index
    @badges = Badge.all
  end
end
