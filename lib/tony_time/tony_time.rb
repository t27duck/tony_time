class TonyTime
  require "date" 

  def next_tony_time
    return @next_tony_time if @next_tony_time
    @next_tony_time = today_tony_time
    if now > today_tony_time || is_weekend?(@next_tony_time)
      begin
        @next_tony_time += 1
      end while is_weekend?(@next_tony_time)
    end
    @next_tony_time
  end

  def during_tony_time?
    !is_weekend?(now) && now.hour == 16 && now.minute <= 10
  end

  private
  def today_tony_time
    @today_tony_time ||= DateTime.new(now.year, now.month, now.day, 16)
  end

  def is_weekend?(datetime)
    [0,6].include? datetime.wday # 0 = Sunday, 6 = Saturday
  end

  def now
    @now ||= DateTime.now
  end
end
