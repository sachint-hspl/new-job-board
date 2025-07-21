class CreateJobPostings < ActiveRecord::Migration[8.0]
  def change
    create_table :job_postings do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :salary_range
      t.string :job_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
