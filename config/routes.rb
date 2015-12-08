Rails.application.routes.draw do
  root 'availability#index'
  post 'availability/check_availability' => 'availability#check_availability', as: :check_availability
  get 'availability/lodgings/list' => 'availability#available_lodging_list', as: :available_lodging_list
  post 'availability/check_holiday' => 'availability#check_holiday'
  post 'availability/check_restricted_period' => 'availability#check_restricted_period'
end
