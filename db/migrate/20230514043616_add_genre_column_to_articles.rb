class AddGenreColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :genre, :string
  end
end
