class JobPosting < ApplicationRecord
  belongs_to :user

  validates :title, :description, :location, :salary_range, :job_type, presence: true
end
