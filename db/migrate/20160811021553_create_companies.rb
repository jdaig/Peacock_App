class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name_co
      t.string :ceo_co
      t.string :page
      t.string :type
      t.text :description
      
      t.timestamps
    end
  end
end
