class Availability::ReservationAvailabilityDisplay
  include Utilities::HttpUtilities

  def initialize(parameters)
    @parameters = parameters
  end

  def call
    response = send_http_request('availability/potential_reservations.json', 'get', @parameters )
    JSON.parse(response.body)
  end
end