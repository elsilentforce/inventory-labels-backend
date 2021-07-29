module Api
  module V1
    class StoragesController < ApplicationController
      def index
        @storages = Storage.filter(filtering_(params))
        render json: @storages, status: :ok
      end
    
      private
      def filtering_(params)
        params.slice(:description)
      end

      def set_storage
        @storage = Storage.find(params[:id])
      end
  
      def storage_params
        params.require(:storage).permit(:name, :friendly_id)
      end
    end
  end
end