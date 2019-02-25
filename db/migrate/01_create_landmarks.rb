class CreateLandmarks < ActiveRecord::Migration
  create_table :Landmarks do |t|
    t.string :name
    t.integer :figure_id
    t.integer :year_completed
  end
end
