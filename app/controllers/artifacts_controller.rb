class ArtifactsController < ApplicationController
  EDITABLE_PARAMS = [
    :description,
    :user_ids,
    :image,
    :whole_class,
    user_ids: [],
    comprehends_user_ids: [],
    not_comprehends_user_ids: [],
    tags: []
  ].freeze

  def new
    @artifact = Artifact.new
  end

  def create

    new_params = artifact_params
    comprehends_user_ids = new_params.delete(:comprehends_user_ids) || []
    not_comprehends_user_ids = new_params.delete(:not_comprehends_user_ids) || []

    @artifact = Artifact.create(new_params)
    @artifact.update_attributes({
                                    comprehends_user_ids: comprehends_user_ids,
                                    not_comprehends_user_ids: not_comprehends_user_ids
                                }.with_indifferent_access)

    if @artifact.errors.any?
      @comprehends_user_ids = comprehends_user_ids
      @not_comprehends_user_ids = not_comprehends_user_ids
      render 'artifacts/new'
    else
      redirect_to artifacts_path
    end
  end

  def edit
    @artifact = Artifact.find(params[:id])
  end

  def update
    @artifact = Artifact.find(params[:id])
    @artifact.update_attributes(artifact_params)

    if @artifact.errors.any?
      render 'artifacts/new'
    else
      redirect_to artifacts_path
    end
  end

  def artifact_params
    params.require(:artifact).permit(EDITABLE_PARAMS)
  end

  def index
    @artifacts = Artifact.all
  end
end
