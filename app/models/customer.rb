class Customer < Account
  has_many :time_entries
  has_paper_trail
  scope :premier, -> { where("employees > ?", 85)}
  scope :newest, -> { order("created_at DESC") }
  scope :starts_with, -> (letter) { where("name LIKE ?", letter + "%") }
end