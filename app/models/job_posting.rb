class JobPosting < ApplicationRecord
  belongs_to :user
  has_many :job_applications, dependent: :destroy

  validates :title, :description, :location, :salary_range, :job_type, presence: true
end
