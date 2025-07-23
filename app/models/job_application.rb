class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job_posting

  has_one_attached :resume

  validates :name, :email, :resume, presence: true
  validates :user_id, uniqueness: { scope: :job_posting_id, message: "You have already applied for this job." }

  def self.ransackable_attributes(auth_object = nil)
    %w[email name created_at]
  end

end
