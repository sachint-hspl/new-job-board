# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


Job Board Application – Documentation
    
        Overview
A job board platform built with Ruby on Rails that supports:
Job posting management (CRUD)
Resume uploads
Role-based access (Employer / Job Seeker)
Search and filtering (via Ransack)
Tailwind CSS for modern UI
StimulusJS + ES6 for interactivity
Authentication with Devise
Pagination and validation
Resume download support (ActiveStorage)

Tech Stack
Layer	Technology
Backend -	Ruby on Rails (v7+)
Frontend -	Tailwind CSS + Stimulus + ES6
Auth -	Devise
ORM -	ActiveRecord + PostgreSQL
File Uploads -	Active Storage
Search -	Ransack
Linting -	RuboCop // Not yet done will used it asap
Pagination -	Kaminari
JS Build -	Importmaps (Rails 7 default)
Testing	- RSpec (optional) // Not yet done will used it asap



Project Setup
1. Clone the Repo
git clone https://github.com/your-org/job-board.git
cd job-board

2. Install Dependencies
bundle install
yarn install # if you're using jsbundling or node

3. Set up Database
rails db:create
rails db:migrate
rails db:seed

4. Run the Server
bin/dev

User Roles
Roles Table:
Role
EMPLOYER
JOB_SEEKER

Associations:
Users can have one role via user_roles join table.
Role-based access is enforced using before_action in controllers.

Key Features Implemented

Authentication
Implemented using Devise
Signup/Login for both Employers and Job Seekers
Role is assigned during signup using roles and user_roles tables

Job Postings
Employers can create, edit, delete, and view job listings
Each job posting includes title, description, location, salary range, job type

rails g scaffold JobPosting title description:text location salary_range job_type

Job Applications
Job Seekers can apply to jobs and upload resumes
Resume uploaded using Active Storage
Employers can view applications and download resumes

Search and Filtering
Integrated Ransack to filter job applications by email
<%= search_form_for @q do |f| %>
  <%= f.search_field :email_cont, placeholder: "Search by Email" %>
<% end %>

Pagination
Used Kaminari to paginate job listings and applications
<%= paginate @job_postings %>

Styling
Tailwind CSS used for form layout, tables, and responsiveness
Tables styled similar to job listing pages like Naukri/Indeed

Interactivity
Used StimulusJS for dropdowns, form toggling, dynamic resume preview, etc.
Assets managed with Importmaps

Linting and Formatting
Installed RuboCop with rubocop-rails for consistent code style
bundle exec rubocop -A

Testing (Optional)
Setup with RSpec and Capybara for feature and model tests
bundle exec rspec
