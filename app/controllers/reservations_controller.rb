class ReservationsController < ApplicationController
  def reserve_lodging
    session[:lodging_ids] = params[:lodging_id]
    redirect_to guests_login_path
  end

end
