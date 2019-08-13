class CreateInterventionpages < ActiveRecord::Migration[5.2]
  def change
    create_table :interventionpages do |t|

      t.timestamps
    end
  end
end
