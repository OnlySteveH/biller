class Account < ActiveRecord::Base
  has_many :account_entries, dependent: :destroy

  validates :name, presence: true, 
  						length: {in: 1..70, 
  											message: "Please use a decent name, sir."},
  						uniqueness: true
  validate :your_name_is_not_dumb

  def your_name_is_not_dumb
  		if name.include?("dumb")
  			errors.add(:name, "is dumb")
  		end
  end

  def update_balance!
    update_attributes(
      balance: self.account_entries.approved.sum(:amount)
    )
  end

end
