require 'date'

class DateFormatter
  def initialize(date = Date)
    @date = date
  end

  def get_date
    @date.today.strftime('%d/%m/%Y')
  end
end
