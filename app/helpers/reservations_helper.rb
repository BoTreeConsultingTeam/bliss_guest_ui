module ReservationsHelper

  def weekday_peak_rate(lodging_rates, age)
    if age  == 'adult'
      lodging_rates.send(:adult_weekday_peak).rate
    else
      lodging_rates.send("#{age}_rates").rate
    end
  end

  def weekend_peak_rate(lodging_rates, age)
    if age  == 'adult'
      lodging_rates.send(:adult_weekend_peak).rate
    else
      lodging_rates.send("#{age}_rates").rate
    end
  end

  def weekday_non_peak_rate(lodging_rates, age)
    if age  == 'adult'
      lodging_rates.send(:adult_weekday_non_peak).rate
    else
      lodging_rates.send("#{age}_rates").rate
    end
  end

  def weekend_non_peak_rate(lodging_rates, age)
    if age  == 'adult'
      lodging_rates.send(:adult_weekend_non_peak).rate
    else
      lodging_rates.send("#{age}_rates").rate
    end
  end
end
