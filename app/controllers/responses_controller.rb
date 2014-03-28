class ResponsesController < ApplicationController

  def new
    Response.new(params[:convo])
    binding.pry
  end

  def destroy
    convo = Response.find_by_user_id_and_convo_id(current_user.id, params[:id])
    convo.destroy
    redirect_to convo_path(params[:id])
  end

end