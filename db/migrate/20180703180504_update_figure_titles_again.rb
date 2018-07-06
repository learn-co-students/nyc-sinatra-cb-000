class UpdateFigureTitlesAgain < ActiveRecord::Migration
  def change
    rename_column :figure_titles, :title_ids, :title_id
  end
end
