class DateFormatter
  def initialize(date = Date)
    @date = date
  end

  def getDate
    @date.today.strftime('%d/%m/%Y')
  end
end
