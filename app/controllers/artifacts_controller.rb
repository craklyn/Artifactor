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

  def search
    if params.has_key?(:search)

      if params[:search][:student_id].present?
        student = User.where(id: params[:search][:student_id]).first
      end

      @artifacts = Artifact.all.includes(:users).select do |artifact|
        keep = false
        (params[:search][:tags] || []).each do |tag|
          if tag.present? && (tag.in? (artifact.tags || []))
            keep = true
          end
        end

        if params[:search][:q].present?
          q = params[:search][:q]
          terms = q.split(/ +/i).map{|e| e.strip}.select{|e| e.present?}

          terms.each do |term|
            if artifact.description.index(term)
              keep = true
            end

            if artifact.users.select{|u|
              u.first_name.strip.downcase == term.downcase ||
              u.last_name.strip.downcase == term.downcase
            }.any?
              keep = true
            end
          end
        end


        if student
          if student.in?(artifact.users)
            keep = true
          end
        end



        keep
      end

      if (params[:search][:tags].blank? || params[:search][:tags].map{|t| t.blank?}.all?) &&
          params[:search][:q].blank? &&
          params[:search][:student_id].blank?
        @artifacts = Artifact.all
      end
    else
      @artifacts = Artifact.all
    end


    render json: {html: render_to_string(partial: 'artifacts/list')}
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
