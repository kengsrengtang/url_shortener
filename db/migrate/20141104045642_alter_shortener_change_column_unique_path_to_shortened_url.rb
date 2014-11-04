class AlterShortenerChangeColumnUniquePathToShortenedUrl < ActiveRecord::Migration
  def up
    rename_column :shorteners, :unique_path, :shortened_url  
  end

  def down
    rename_column :shorteners, :shortened_url, :unique_path
  end
end
