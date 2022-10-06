class Account < ApplicationRecord
  enum :sexe, [:male, :female]
  enum :status, pending: 0, activated: 1, disabled: 2
  belongs_to :user #, class_name: "object", foreign_key: "object_id"
  
  has_one :card, dependent: :destroy
  

  validates_presence_of :user_id

end
