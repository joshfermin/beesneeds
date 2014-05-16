# Handles HTTP requests for Pages
class PagesController < ApplicationController
  def home
  end

  def stat
   @data = Report.where("date(created_at) > ?", 15.days.ago).group("date(created_at)").count.values.reverse!
  end
end
