class DropImage < ActiveRecord::Migration[6.1]
  def change
    drop_table :images do |t|
      t.binary :file

      t.timestamps
    end
  end
end
