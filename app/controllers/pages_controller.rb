class PagesController < ApplicationController
  def index
    @events = Event.where(:start_date => Date.today..(Date.today + 1.month))
  end

  def contact
  end
end
