class ChangeAgeFromIntegerToString < ActiveRecord::Migration[4.2]
  def up
  	change_table :levels, :force => true do |t|
  		t.change :age, :string
  	end
  end

  def down
  	change_table :levels, :force => true do |t|
  		t.change :age, :integer
  	end
  end
end
