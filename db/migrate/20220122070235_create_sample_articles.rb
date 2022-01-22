class CreateSampleArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :sample_articles do |t|

      t.timestamps
    end
  end
end
