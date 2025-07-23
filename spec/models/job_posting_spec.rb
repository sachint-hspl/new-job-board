require 'rails_helper'

RSpec.describe JobPosting, type: :model do
  let(:user) { User.create(email: "test@example.com", password: "password") }

  it "is valid with valid attributes" do
    job = JobPosting.new(
      title: "Developer",
      description: "Write code",
      location: "Remote",
      salary_range: "5-10 LPA",
      job_type: "Full-time",
      user: user
    )
    expect(job).to be_valid
  end

  it "is invalid without a title" do
    job = JobPosting.new(title: nil)
    expect(job).not_to be_valid
  end
end
