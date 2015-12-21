class GuestsController < ApplicationController
  def display_checklist
  end

  def login
  end

  def search_user
    @search = Guests::Search.new(params)
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
end
