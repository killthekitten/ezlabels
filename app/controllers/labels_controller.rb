class LabelsController < ApplicationController
  before_action :set_project
  before_action :set_label, only: [:show, :inspect]

  def show
  end

  def inspect
    @label.inspected = true
    @label.user = current_user

    if @label.update(label_params)
      redirect_to_next_page
    else
      redirect_to :show, alert: "Couldn't save label info, check your actions"
    end
  end

  def next
    redirect_to_next_page
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = label.where(project: @project).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def label_params
      params.require(:label).permit(:rejected, label_class_ids: [])
    end

    def redirect_to_next_page
      next_label = get_first_uninspected

      if next_label.blank?
        @project.generate_samples_for(current_user)
        next_label = get_first_uninspected
      end

      if next_label.present?
        redirect_to project_label_path(@project, next_label)
      else
        redirect_to @project, notice: "No labels left, you're good!"
      end
    end

    def get_first_uninspected
      Project.uncached { @project.labels.uninspected_for(current_user).first }
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end
