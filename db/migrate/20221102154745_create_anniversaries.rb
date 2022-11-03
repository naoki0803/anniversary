class CreateAnniversaries < ActiveRecord::Migration[6.0]
  def change
    create_table :anniversaries do |t|
      t.string      :anniversary_name,         null: false
      t.date        :anniversary_date,         null: false
      t.string      :anniversary_description  
      t.integer     :category_id              
      t.string      :who_anniversary          
      t.references  :user,                     null: false, foreign_key: true
      t.timestamps
    end
  end
end
