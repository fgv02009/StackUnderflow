class CreateIceCreams < ActiveRecord::Migration
  def change
    create_table :ice_creams do |t|
      t.string :flavor
      t.string :topping
      t.string :consumer
      t.string :country
      t.timestamps
    end
  end
end
