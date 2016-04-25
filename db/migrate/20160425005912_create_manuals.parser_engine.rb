# This migration comes from parser_engine (originally 20160425004221)
class CreateManuals < ActiveRecord::Migration
  def change
    create_table :parser_engine_manuals do |t|
      t.string :pdf_url
      t.string :page_url
      t.text :data
    end  
  end
end
