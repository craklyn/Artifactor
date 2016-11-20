class Artifact < ActiveRecord::Base

  CONTENT_TYPE_REGEX = /\Aimage\/.*\Z/

  has_many :user_artifacts
  has_many :users, through: :user_artifacts

  has_attached_file :image,
                    styles:      { small: '40x40#', medium: '100x100#', large: '300x300#' },
                    path:        ':attachment/:id/:style/:fingerprint'


  validates :description, presence: true
  validates_attachment :image, content_type: { content_type: CONTENT_TYPE_REGEX }

  serialize :tags
end
