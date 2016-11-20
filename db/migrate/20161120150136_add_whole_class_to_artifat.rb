class AddWholeClassToArtifat < ActiveRecord::Migration
  def change
    add_column :artifacts, :whole_class, :boolean, default: false
  end
end
