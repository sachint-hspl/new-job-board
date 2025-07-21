%w[ADMIN EMPLOYER JOB_SEEKER].each do |role|
  Role.find_or_create_by!(name: role)
end