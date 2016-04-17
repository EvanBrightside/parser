class Manual < ActiveRecord::Migration
  def change
    create_table :manuals do |t|
      t.string :pdf_url
      t.string :page_url
      t.text :data
    end  
  end
end
