class CharactersController < ApplicationController
  def index
    @characters = Character.search(params)
  end

  def destroy
    @character = Character.find(params[:id])

    respond_to do |format|
      if @character.destroy
        flash.now[:notice] = "Character was successfully deleted"
        format.turbo_stream
      end
    end
  end
end
