class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :user_artifacts
  has_many :artifacts, through: :user_artifacts

end
