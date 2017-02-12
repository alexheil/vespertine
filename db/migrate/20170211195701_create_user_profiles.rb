class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
    	t.references :user
    	t.string :first_name, default: ""
    	t.string :last_name, default: ""
    	t.integer :age, default: ""
    	t.string :location, default: ""
    	t.string :gender, default: ""
    	t.text :biography, default: ""
    	t.string :theme_color, default: ""

      t.timestamps
    end
  end
end
