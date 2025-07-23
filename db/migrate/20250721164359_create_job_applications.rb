# frozen_string_literal: true

class CreateJobApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :job_applications do |t|
      t.string :name
      t.string :email
      t.references :user, null: false, foreign_key: true
      t.references :job_posting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
