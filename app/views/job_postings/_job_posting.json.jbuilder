# frozen_string_literal: true

json.extract! job_posting, :id, :title, :description, :location, :salary_range, :job_type, :user_id, :created_at,
              :updated_at
json.url job_posting_url(job_posting, format: :json)
