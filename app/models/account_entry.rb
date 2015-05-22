class AccountEntry < ActiveRecord::Base
  belongs_to :account
  has_paper_trail
  
  validates :account_id, presence: true
  validates_associated :account

  after_save :update_account_balance!, :if => :approved?

  scope :approved, -> { with_state(:approved) }
  scope :submitted, -> { with_state(:submitted) }
  scope :rejected, -> { with_state(:rejected) }

  state_machine :state, :initial => :submitted do 
  	event :approve do
  		transition :submitted => :approved
  	end

  	event :reject do
  		transition :submitted => :rejected
  	end

  end

  def update_account_balance!
  	account.update_balance!
  	account.save
  end
end