class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |t|
      t.integer :title_ids
      t.integer :figure_ids
    end 
  end
end
