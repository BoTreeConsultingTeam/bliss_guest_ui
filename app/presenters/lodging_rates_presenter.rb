class LodgingRatesPresenter
  attr_reader :child_rates, :teen_rates, :toddler_rates, :adult_weekday_peak, :adult_weekend_peak, :adult_weekend_non_peak, :adult_weekday_non_peak, :lodging_type

  def initialize(response)
    @child_rates = OpenStruct.new(response["child"]["base_rate"])
    @teen_rates = OpenStruct.new(response["teen"]["base_rate"])
    @toddler_rates = OpenStruct.new(response["toddler"]["base_rate"])
    @adult_weekday_peak = OpenStruct.new(response["weekday_peak"]["base_rate"])
    @adult_weekend_peak = OpenStruct.new(response["holiday_or_weekend_peak"]["base_rate"])
    @adult_weekend_non_peak = OpenStruct.new(response["holiday_or_weekend_non_peak"]["base_rate"])
    @adult_weekday_non_peak = OpenStruct.new(response["weekday_non_peak"]["base_rate"])
    @lodging_type = response["lodging_type"]
  end
end