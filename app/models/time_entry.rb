class TimeEntry < AccountEntry
  belongs_to :employee

  before_create :calculate_amount!

  def self.per_hour
    34
  end

  def calculate_amount!
    self.amount = TimeEntry.per_hour * self.time
    if self.amount > 1000
    	false
    end
    true
  end
end
