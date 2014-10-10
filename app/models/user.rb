class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation, :name
  
  belongs_to :organization
  has_many :tasks
  has_many :grants, :through => :organization

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true
  
  scope :admin, where(admin: true)
  
end
