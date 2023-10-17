class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :stack
      t.string :description
      t.string :github_link
      t.string :image_url
      t.timestamps
    end
  end
end
