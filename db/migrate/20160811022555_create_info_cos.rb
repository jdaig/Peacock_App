class CreateInfoCos < ActiveRecord::Migration[5.0]
  def change
    create_table :info_cos do |t|
      t.string :name_co
      t.string :ceo_co
      t.string :page
      t.string :type
      t.text :description
      # Falta poner la latitud y longitud
      t.timestamps
    end
  end
end
