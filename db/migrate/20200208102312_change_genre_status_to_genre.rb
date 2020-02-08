class ChangeGenreStatusToGenre < ActiveRecord::Migration[5.2]
  def change
  	change_column :genres, :genre_status, :boolean, default: true, null: false
  end
end
