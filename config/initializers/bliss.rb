bliss_date_formats = {
  short_date: "%m/%d/%Y",
  bliss_stamp: "%a %b %d, %Y, %l:%M %p",
  day_and_date: "%a %e %b %Y",
  day_month_date: "%a, %b %e",
  month_and_day: "%b %e",
  short_month_and_day: "%m/%d",
  bliss_time: "%l:%M %p",
}

Time::DATE_FORMATS.merge!(bliss_date_formats)
Date::DATE_FORMATS.merge!(bliss_date_formats)