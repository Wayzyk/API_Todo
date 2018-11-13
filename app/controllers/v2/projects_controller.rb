class V2::ProjectsController < ApplicationController
  def index
    json_response({message: 'It version 2'})
  end
end
