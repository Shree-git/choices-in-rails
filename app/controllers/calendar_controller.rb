class CalendarController < ApplicationController
  def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = Meeting.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def new
    @meeting = Meeting.new
  end

  def create_event
    # @meeting = Meeting.new()
  end
  
end
