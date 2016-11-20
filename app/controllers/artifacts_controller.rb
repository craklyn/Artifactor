class ArtifactsController < ActionController::Base

  def index
    @student = Student.find(params[:id])
    @artifacts = @student.artifacts
  end

end
