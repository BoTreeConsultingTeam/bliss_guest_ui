class AvailabilityController < ApplicationController
  def check_availability
    params[:date] = params[:arrival_date]
    session[:nights] = params[:nights].to_i
    session[:people] = params[:people].to_i
    session[:date] = params[:date]
    @check_availability = Availability::ReservationAvailabilityDisplay.new(params)
    @lodgings_list = @check_availability.call
    if @lodgings_list.present?
      redirect_to available_lodging_list_path
    else
      render 'check_availability'
    end
  end
end
