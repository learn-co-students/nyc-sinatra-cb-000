class CreateNyc < ActiveRecord::Migration[5.1]
  def change
    create_table :figures do |t|
      t.string :name
    end

    create_table :landmarks do |t|
      t.string :name
      t.belongs_to :figure
      t.integer :year_completed
    end

    create_table :titles do |t|
      t.string :name
    end

    create_table :figure_titles do |t|
      t.belongs_to :figure, index: true
      t.belongs_to :title, index: true
    end
  end
end
