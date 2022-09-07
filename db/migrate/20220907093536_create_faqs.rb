class CreateFaqs < ActiveRecord::Migration[6.1]
  def change
    create_table :faqs do |t|
      t.text :question
      t.text :answer
      t.boolean :status      
      t.timestamps
    end
  end
end
