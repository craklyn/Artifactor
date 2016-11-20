class Artifact < ActiveRecord::Base

  CONTENT_TYPE_REGEX = /\Aimage\/.*\Z/
  TAG_LIST = [
      "Reading",
      "Math",
      "Physical Development",
      "Social Studies",
      "Writing",
      "Science",
      "Peer Interaction"
  ]

  has_many :user_artifacts
  has_many :users, through: :user_artifacts

  has_attached_file :image,
                    styles:      { small: '40x40#', medium: '100x100#', large: '300x300#' },
                    path:        ':attachment/:id/:style/:fingerprint'


  validates :description, presence: true
  validates_attachment :image, content_type: { content_type: CONTENT_TYPE_REGEX }

  accepts_nested_attributes_for :user_artifacts
  serialize :tags

  default_scope { order(updated_at: :desc) }

  def prep_attrs(attrs)
    h = attrs.delete(:comprehends) || {}
    comprehends_user_ids = h.select{|k,v| v == 'yes'}.keys
    not_comprehends_user_ids = h.select{|k,v| v == 'no'}.keys

    comprehends_user_ids.each do |user_id|
      existing = UserArtifact.where(user_id: user_id, artifact_id: self.id).first
      if existing
        existing.update_attributes(comprehends: true)
      else
        UserArtifact.create(user_id: user_id, artifact_id: self.id, comprehends: true)
      end
    end

    not_comprehends_user_ids.each do |user_id|
      existing = UserArtifact.where(user_id: user_id, artifact_id: self.id).first
      if existing
        existing.update_attributes(comprehends: false)
      else
        a = UserArtifact.create(user_id: user_id, artifact_id: self.id, comprehends: false)
      end
    end


    if (comprehends_user_ids.any? || not_comprehends_user_ids.any? )
      attrs.delete(:user_ids)
    end

    attrs
  end

  def update_attributes(attrs)
    attrs = prep_attrs(attrs)
    super(attrs)
  end
end
