# frozen_string_literal: true

class JobPosting < ApplicationRecord
  belongs_to :user
  has_many :job_applications, dependent: :destroy

  validates :title, :description, :location, :salary_range, :job_type, presence: true

  # Ransack config
  def self.ransackable_attributes(_auth_object = nil)
    %w[title location job_type created_at updated_at description salary_range]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[user job_applications]
  end
end
