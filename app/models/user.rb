class User < ActiveRecord::Base

  EMAIL_REGEX =  /\A[-'a-z0-9_+\.]+\@([-'a-z0-9]+\.)+[a-z0-9]{2,6}\z/i.freeze

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }


  has_many :user_artifacts
  has_many :artifacts, through: :user_artifacts

end
