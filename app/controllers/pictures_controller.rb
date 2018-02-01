class PicturesController < ApplicationController
  before_action :set_project
  before_action :set_picture, only: [:show, :approve, :reject]

  def show
  end

  def inspect
    @picture.inspected = true
    @picture.rejected = rejected

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
      params.require(:picture).permit(:rejected, :picture_class_id)
    end

    def redirect_to_next_page
      next_picture = @project.pictures.where(inspected: false).first

      if next_picture
        redirect_to project_picture_path(@project, @picture)
      else
        redirect_to @project, notice: "No pictures left, you're good!"
      end
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end
