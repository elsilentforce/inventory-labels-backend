class StoragesController < ApplicationController

  def index
    @storages = Storage.all
    render json: @storages
  end

  private 
    def set_storage
      @storage = Storage.find(params[:id])
    end

    def storage_params
      params.require(:storage).permit(:name, :friendly_id)
    end
end