class CreateTodos < ActiveRecord::Migration[4.2]
	def change
		create_table :todos do |t|
			t.string :title
			t.string :description
			t.integer :user_id
			t.timestamps
		end
	end
end
