class InitTables < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.timestamps

      t.datetime :created_at
      t.datetime :updated_at

      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at
      t.string :avatar_fingerprint
    end

    create_table :user_artifacts do |t|
      t.integer :user_id
      t.integer :artifact_id
      t.timestamps
    end

    create_table :artifacts do |t|
      t.text :description
      t.text :tags

      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.string   :image_fingerprint

      t.timestamps
    end

  end
end