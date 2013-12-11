class ConvosUsersController < ApplicationController

  def destroy
    convo = ConvosUser.find_by_user_id_and_convo_id(current_user.id, params[:id])
    convo.destroy
    redirect_to convo_path(params[:id])
  end

end