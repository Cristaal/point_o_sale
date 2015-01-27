class CreatePurchase < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:name, :string)

      t.timestamps
    end
  end
end
