class ReservationsController < ApplicationController
  def reserve_lodging
    session[:lodging_ids] = params[:lodging_id]
    redirect_to guests_login_path
  end

  def lodging_details
    params[:date] = session[:date]
    params[:night] = session[:nights]
    @lodging_info = Availability::ReservationAvailabilityDisplay.new(params)
    @lodging_rates = @lodging_info.lodging_details
    respond_to do |format|
      format.js
    end
  end
end
