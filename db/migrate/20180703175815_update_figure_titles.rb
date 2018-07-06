class UpdateFigureTitles < ActiveRecord::Migration
  def change
    rename_column :figure_titles, :figure_ids, :figure_id
    rename_column :figure_titles, :title_ids, :title_ids
  end
end
