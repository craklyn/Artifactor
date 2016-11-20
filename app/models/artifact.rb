class Artifact < ActiveRecord::Base

  has_many :user_artifacts
  has_many :users, through: :user_artifacts

end
