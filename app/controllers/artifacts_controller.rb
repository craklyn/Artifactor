class ArtifactsController < ApplicationController
  EDITABLE_PARAMS = [
    :description,
    :user_ids,
    :image,
    tags: []
  ].freeze

  def new
    @artifact = Artifact.new
  end

  def create
    @artifact = Artifact.create(artifact_params)
    if @artifact.errors.any?
      render 'artifacts/new'
    else
      redirect_to
    end
  end

  def artifact_params
    params.require(:artifact).permit(EDITABLE_PARAMS)
  end

  def index
    @artifacts = Artifact.all
  end
end
