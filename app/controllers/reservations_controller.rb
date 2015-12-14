class ReservationsController < ApplicationController
  def reserve_lodging
    session[:lodging_ids] = params[:lodging_id]
    redirect_to display_checklist_path
  end
end
