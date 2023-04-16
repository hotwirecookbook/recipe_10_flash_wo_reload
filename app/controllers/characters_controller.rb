class CharactersController < ApplicationController
  def index
    @characters = Character.search(params)
  end
end
