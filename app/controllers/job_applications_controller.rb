class JobApplicationsController < ApplicationController
    before_action :authenticate_user!, except: [:new, :create]
    before_action :set_job_posting

    def new
        @job_application = JobApplication.new
    end

    def create
        @job_posting = JobPosting.find(params[:job_posting_id])
        existing_application = JobApplication.find_by(user: current_user, job_posting: @job_posting)

        if existing_application
            redirect_to @job_posting, alert: "You've already applied for this job."
        else
            @job_application = @job_posting.job_applications.build(job_application_params)
            @job_application.user = current_user

            if @job_application.save
            redirect_to @job_posting, notice: "Application submitted successfully."
            else
            render :new, status: :unprocessable_entity
            end
        end
    end

    def index
        @job_posting = JobPosting.find(params[:job_posting_id])

        if current_user.has_role?('EMPLOYER') && @job_posting.user_id == current_user.id
            @q = @job_posting.job_applications.ransack(params[:q])
            @applications = @q.result.includes(:user).order(created_at: :desc).page(params[:page]).per(2)
        else
            redirect_to root_path, alert: "Access denied or invalid job posting."
        end
    end

    private

    def set_job_posting
        @job_posting = JobPosting.find(params[:job_posting_id])
    end

    def job_application_params
        params.require(:job_application).permit(:name, :email, :resume)
    end

    def authorize_employer!
        unless current_user.has_role?('EMPLOYER') || current_user.has_role?('ADMIN')
        redirect_to root_path, alert: "Not authorized"
        end
    end
end
