class CreateGiveaways < ActiveRecord::Migration
  def change
    create_table :giveaways do |t|
      

      t.timestamps
    end
  end
end
