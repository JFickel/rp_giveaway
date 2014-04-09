class CreateGiveaways < ActiveRecord::Migration
  def change
    create_table :giveaways do |t|
      t.datetime :release_time

      t.timestamps
    end
  end
end
