# frozen_string_literal: true

class JobPostingPolicy < ApplicationPolicy
  def index?
    true # All users can list job postings
  end

  def show?
    true # All users can view job postings
  end

  def create?
    user_is_employer?
  end

  def update?
    user_is_employer_and_owner?
  end

  def destroy?
    user_is_employer_and_owner?
  end

  def apply?
    user_is_job_seeker?
  end

  private

  def user_is_employer?
    user&.roles&.exists?(name: 'EMPLOYER')
  end

  def user_is_job_seeker?
    user&.roles&.exists?(name: 'JOB_SEEKER')
  end

  def user_is_employer_and_owner?
    user&.roles&.exists?(name: 'EMPLOYER') && record.user_id == user.id
  end
end
