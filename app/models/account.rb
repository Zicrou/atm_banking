class Account < ApplicationRecord
  enum :sexe, [:male, :female]
  #enum :status, [:pending, :activated, :disabled]
  belongs_to :user #, class_name: "object", foreign_key: "object_id"
  
  has_one :card

  validates_presence_of :user_id

end
