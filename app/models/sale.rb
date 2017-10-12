class Sale < ActiveRecord::Base

  def status
    if self.start_date > Date.current
      return :Upcoming
    elsif self.end_date < Date.current
      return :Expired
    else
      return :Active
    end
  end

end
