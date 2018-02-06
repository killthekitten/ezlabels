class PicturesController < ApplicationController
  before_action :set_project
  before_action :set_picture, only: [:show, :inspect]

  def show
  end

  def inspect
    @picture.inspected = true
    @picture.user = current_user

    if @picture.update(picture_params)
      redirect_to_next_page
    else
      redirect_to :show, alert: "Couldn't save picture info, check your actions"
    end
  end

  def next
    redirect_to_next_page
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.where(project: @project).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:rejected, picture_class_ids: [])
    end

    def redirect_to_next_page
      next_picture = get_first_uninspected

      if next_picture.blank?
        @project.generate_samples_for(current_user)
        next_picture = get_first_uninspected
      end

      if next_picture.present?
        redirect_to project_picture_path(@project, next_picture)
      else
        redirect_to @project, notice: "No pictures left, you're good!"
      end
    end

    def get_first_uninspected
      @project.pictures.uninspected_for(current_user).first
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end
