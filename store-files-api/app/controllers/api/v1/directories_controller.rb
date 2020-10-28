class Api::V1::DirectoriesController < ApplicationController
  before_action :set_directory, except: [:index, :create]
    
  def index
    params[:page] ||= 1
    params[:per_page] ||= 10
    params[:order] ||= "asc"

    @directories = Directory
                    .filter(by_name: params[:name])
                    .order(name: params[:order])
                    .paginate(page: params[:page], per_page: params[:per_page]).where(directory_id: nil)
  end

  def show
    
  end
  
  def create
    @directory = Directory.create(directory_params)

    if @directory.errors.any?
      return render json: { errors: @directory.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    unless @directory.update(directory_params)
      return render json: { errors: @directory.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    unless @directory.destroy
      return render json: { errors: @directory.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def directory_params
    params.require(:name)
    params.permit(:name, archives_attributes: [:id, :name, :attachment])
  end

  def set_directory
    @directory = Directory.find_by_id(params[:id])

    if @directory.nil?
      return render json: { message: 'Directory not found' }, status: :not_found
    end
  end
end
