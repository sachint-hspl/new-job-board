# frozen_string_literal: true

json.array! @job_postings, partial: 'job_postings/job_posting', as: :job_posting
