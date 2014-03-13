class CreateLdmcReadGenerals < ActiveRecord::Migration
  def change
    create_table :ldmc_read_generals do |t|

      t.timestamps
    end
  end
end
