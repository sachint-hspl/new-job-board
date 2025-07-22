# app/controllers/job_postings_controller.rb
class JobPostingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_job_posting, only: %i[show edit update destroy]
  before_action :authorize_employer!, only: %i[new create edit update destroy]


  # def index
  #   @job_postings = JobPosting.all
  # end

  # def index
  #   @job_postings = JobPosting.includes(:user).all
  # end

  def index
    # @job_postings = JobPosting.includes(:user).order(created_at: :desc)
    @job_postings = JobPosting.order(created_at: :desc).page(params[:page]).per(10)
  end


  def show; 
    @job_posting = JobPosting.find(params[:id])
    @applications = @job_posting.job_applications.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @job_posting = JobPosting.new
  end

  def create
    @job_posting = current_user.job_postings.build(job_posting_params)

    if @job_posting.save
      redirect_to job_postings_path, notice: "Job was successfully created."
    else
      flash.now[:alert] = "Failed to create job."
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @job_posting.update(job_posting_params)
      redirect_to job_posting_path(@job_posting), notice: "Job updated successfully."
    else
      flash.now[:alert] = "Failed to update job."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @job_posting.destroy
      redirect_to job_postings_path, notice: "Job deleted successfully."
    else
      redirect_to job_postings_path, alert: "Failed to delete job."
    end
  end

  private

  def set_job_posting
    @job_posting = JobPosting.find(params[:id])
  end

  def job_posting_params
    params.require(:job_posting).permit(:title, :description, :location, :salary_range, :job_type)
  end

  def authorize_employer!
    unless current_user.roles.exists?(name: 'EMPLOYER')
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
end
