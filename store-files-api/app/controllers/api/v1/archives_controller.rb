class Api::V1::ArchivesController < ApplicationController
  before_action :set_directory
  before_action :set_archive, except: [:create, :index]

  def create
    @archive = @directory.archives.create(archive_params)

    if @archive.errors.any?
      render json: { errors: @archive.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    params[:page] ||= 1
    params[:per_page] ||= 10
    params[:order] ||= "asc"
    
    @archives = Archive
                 .filter(by_name: params[:name])
                 .where(directory_id: @directory.id)
                 .order(name: params[:order])
                 .paginate(page: params[:page], per_page: params[:per_page])
  end

  def update
    unless @archive.update(archive_params)
      return render json: { errors: @archive.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    unless @archive.destroy
      return render json: { errors: @archive.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_directory
    @directory = Directory.find_by_id(params[:directory_id])

    if @directory.nil?
      return render json: { message: 'Directory not found' }, status: :not_found
    end
  end

  def set_archive
    @archive = Archive.find_by_id(params[:id])

    if @archive.nil?
      return render json: { message: 'File not found' }, status: :not_found
    end
  end

  def archive_params
    params.require(:name)
    params.permit(:name, :attachment)
  end
end
