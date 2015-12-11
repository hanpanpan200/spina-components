class CreateSpinaComponentsTable < ActiveRecord::Migration
  def change
    create_table :spina_components do |t|
      t.string :name
      t.json :param_data
      t.string :use_for
      t.string :file_path, null:false
      t.text :content, null:false
      t.timestamps
    end
  end
end
