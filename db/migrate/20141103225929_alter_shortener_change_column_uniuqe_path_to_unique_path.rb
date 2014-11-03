class AlterShortenerChangeColumnUniuqePathToUniquePath < ActiveRecord::Migration
  def up
    rename_column :shorteners, :uniuqe_path, :unique_path 
  end

  def down
    rename_column :shorteners, :unique_path, :uniuqe_path
  end
end
