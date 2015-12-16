class AvailabilityController < ApplicationController
  def check_availability
    params[:date] = params[:arrival_date]
    session[:nights] = params[:nights].to_i
    session[:people] = params[:people].to_i
    session[:date] = params[:date]
    @start_date = Date.strptime(params[:date], '%m/%d/%Y')
    @end_date = @start_date + params[:nights].to_i
    @check_availability = Availability::ReservationAvailabilityDisplay.new(params)
    @lodgings_list = @check_availability.call
  end

  def check_holiday
    @selected_date = Availability::ReservationAvailabilityDisplay.new(params)
    holiday = @selected_date.holiday?
    render json: holiday
  end

  def check_restricted_period
    @selected_date = Availability::ReservationAvailabilityDisplay.new(params)
    restricted_period = @selected_date.overlaping_period?
    render json: restricted_period
  end
end
