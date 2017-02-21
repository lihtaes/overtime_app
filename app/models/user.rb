class User < ApplicationRecord
  
  PHONE_REGEXP = /\A[0-9]*\Z/

  has_many :posts
  has_many :audit_logs
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :phone
  validates_format_of :phone, with: PHONE_REGEXP
  validates :phone, length: {is: 10} 

  def full_name
    last_name.upcase + ", " + first_name.upcase
  end
end
