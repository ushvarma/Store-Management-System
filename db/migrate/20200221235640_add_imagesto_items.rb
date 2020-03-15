class AddImagestoItems < ActiveRecord::Migration[6.0]
  def change
    change_table :items do |t|
      t.string :brand
      t.attachment :photo

    end
  end
end
