class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :lastname
      t.string :born
      t.string :ocupation
      t.string :soc_stat
      t.string :page
      t.string :type
      t.text :description
      
      t.timestamps
    end
  end
end
