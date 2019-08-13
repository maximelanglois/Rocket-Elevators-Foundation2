class ChangeRelationUser < ActiveRecord::Migration[5.2]

  def change
    remove_reference :batteries, :user, foreign_key: true
    add_reference :batteries, :employee, foreign_key: true
   
  end
  
end



