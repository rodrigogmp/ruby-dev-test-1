class Api::V1::ArchivesController < ApplicationController
  before_action :set_directory, only: [:create, :show]
  before_action :set_archive, except: [:create, :index]

  def create
    @archive = @directory.archives.create(archive_params)

    if @archive.errors.any?
      render json: { errors: @archive.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_directory
    @directory = Directory.find(params[:directory_id])
  end

  def set_archive
    @archive = Archive.find(params[:id])
  end

  def archive_params
    params.require(:name)
    params.permit(:name, :attachment)
  end
end
