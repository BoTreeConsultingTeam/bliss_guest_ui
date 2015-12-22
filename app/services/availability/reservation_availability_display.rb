class Availability::ReservationAvailabilityDisplay
  include Utilities::HttpUtilities

  def initialize(parameters)
    @parameters = parameters
  end

  def call
    response = send_http_request('availability/potential_reservations.json', 'get', @parameters )
    JSON.parse(response.body)
  end

  def holiday?
    response = send_http_request('/admin/check_holiday.json', 'post', @parameters )
    JSON.parse(response.body)
  end

  def overlaping_period?
    response = send_http_request('reservations/check_date_range.json', 'get', @parameters )
    JSON.parse(response.body)
  end

  def lodging_details
    response = send_http_request('/lodgings/price.json', 'post', @parameters )
    lodging_details = JSON.parse(response.body)
    LodgingRatesPresenter.new(lodging_details)
  end
end