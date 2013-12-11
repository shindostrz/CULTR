class ConvosController < ApplicationController

  def index
    @convos = Convo.all
    # @convos.each do |convo|
    #   convo[:user] = convo.user
    # end
    # render :json => @convos

  end

  def show
    @convo = Convo.find(params[:id])
    gon.convo_id = @convo.id
    gon.current_user = current_user
    # @convo[:user] = @convo.user
    # How do I get users for a given convo?
    @responder = ConvosUser.where("convo_id = ?", @convo.id)
    @responders_all = []
    @responder.each do |r|
      @responders_all << r.user_id
    end
  end

  def new
    # redirect_to new_convo_path
  end

  def create
    new_convo = Convo.create(params[:convo])
    redirect_to new_convo
  end

  def create_response
    ConvosUser.create(convo_id: params[:id], user_id: current_user.id)
    redirect_to '/map'
  end

  def edit
    @convo = Convo.find(params[:id])
  end

  def update
     @convo = Convo.update(params[:id], params[:convo])
     redirect_to @convo
  end

  def delete
  end

  def map
    @convos = Convo.all
    gon.coordinates = {}
    gon.topic = {}
    gon.description = {}
    @convos.each do |convo|
      gon.coordinates[convo.id] = [convo.latitude, convo.longitude]
      gon.topic[convo.id] = convo.topic
      gon.description[convo.id] = convo.description
    end

    render :map, layout: "map"
  end

end
