class User < ApplicationRecord
  include RailsJwtAuth::Authenticatable
  include RailsJwtAuth::Confirmable
  include RailsJwtAuth::Recoverable
  include RailsJwtAuth::Trackable
  include RailsJwtAuth::Invitable
  include RailsJwtAuth::Lockable

  has_many :invitations, :class_name => self.to_s, :as => :invited_by  
  belongs_to :invited_by, optional: true, polymorphic: true 
  

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
end