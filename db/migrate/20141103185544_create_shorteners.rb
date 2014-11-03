class CreateShorteners < ActiveRecord::Migration
  def change
    create_table :shorteners do |t|
      t.string :orig_url
      t.string :uniuqe_path

      t.timestamps
    end
  end
end
