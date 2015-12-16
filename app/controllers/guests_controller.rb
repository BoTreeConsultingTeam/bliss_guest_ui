class GuestsController < ApplicationController
  def display_checklist
  end

  def login
  end

  def seach_user
    @search = Guests::Search.new(params)
    @guest_list = @search.call
  end
end
