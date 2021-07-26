class StoragesController < ApplicationController

  def index
    @storages = Storage.all
    render json: @storages
  end

end