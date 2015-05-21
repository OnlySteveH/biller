class TimeEntry < AccountEntry
  belongs_to :employee

  def self.per_hour
    34
  end

  def calculate_amount!
    self.amount = TimeEntry.per_hour * self.time
  end
end
