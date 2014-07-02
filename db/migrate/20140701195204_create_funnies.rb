class CreateFunnies < ActiveRecord::Migration
  def change
    create_table :funnies do |t|
      t.string :description

      t.timestamps
    end
  end
end
