class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, comment: '用户的名称'

      t.timestamps null: false
    end
  end
end
