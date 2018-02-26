class DatasetsController < ApplicationController
  before_action :find_dataset, only: [:show, :edit, :update, :destroy]

  def index
    @datasets = Dataset.all
  end

  def new
    @dataset = Dataset.new
  end

  def create
    @dataset = Dataset.new(dataset_params)

    if @dataset.save
      redirect_to @dataset, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @dataset.update(dataset_params)
      redirect_to @dataset
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @dataset.destroy
    redirect_to datasets_path
  end

  private

  def find_dataset
    @dataset = Dataset.find(params[:id])
  end

  def dataset_params
    params.require(:dataset).permit(:name, :data_type)
  end
end
