class CreateCandidtates < ActiveRecord::Migration
  def change
    create_table :candidtates do |t|
      t.string :name
      t.string :party

      t.timestamps
    end
  end
end
