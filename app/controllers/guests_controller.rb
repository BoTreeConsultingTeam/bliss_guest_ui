class GuestsController < ApplicationController
  def display_checklist
  end

  def login
  end

  def search_user
    @search = Guests::SearchOrCreate.new(params)
    @email = params[:entity]
    @guest_list = @search.call
    if @guest_list.present?
      if @guest_list["entity"] == "Not found"
        @message = t("login.failure_message")
      else
        if @guest_list["entity"]["person"].present?
          if @guest_list["entity"]["person"]["banned"]
            @message = t("login.banned_match_message")
          else
            @message = t("login.success_message")
          end
        end
        end
    end
    respond_to do |format|
      format.js
    end
  end

  def create_user
    @create_guest = Guests::SearchOrCreate.new(params)
    @guest_creation = @create_guest.create
    if @guest_creation["role_creation"] == 'success'
      @mail_result = GuestMailer.send_setup_details(@guest_creation['user'].merge!({ email: params[:email]})).deliver
    end
    redirect_to :back
  end
end
