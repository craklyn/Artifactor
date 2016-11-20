class AddComprehendsToUserArtifacts < ActiveRecord::Migration
  def change
    add_column :user_artifacts, :comprehends, :boolean, default: nil
  end
end
