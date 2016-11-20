class User < ActiveRecord::Base

  has_many :user_artifacts
  has_many :artifacts, through: :user_artifacts

end
