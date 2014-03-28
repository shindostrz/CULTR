class ConvosController < ApplicationController

  def index
    @convos = Convo.all
  end

  def show
    @convo = Convo.find(params[:id])
    gon.convo_id = @convo.id
    gon.current_user = current_user
    # @convo[:user] = @convo.user
    # How do I get users for a given convo?
    @responder = Response.where("convo_id = ?", @convo.id)
    @responders_all = []
    @responder.each do |r|
      @responders_all << r.user_id
    end
  end

  def new
    @user = current_user
    @convo = @user.convos.new
    @categories = Category.all
  end

  def create
    @user = current_user
    @convo = @user.convos.create(params[:convo])
    redirect_to user_convos_path(@user)
  end

  def edit
    @user = current_user
    @convo = @user.convos.find(params[:id])
  end

  def update
    @user = current_user
    @convo = @user.convos.update(params[:id], params[:convo])
    redirect_to user_convo_path(@user.id, @convo.id)
  end

  def delete
  end

  def map
    gon.current_user = current_user
    @convos = Convo.all
    gon.coordinates = {}
    gon.category = {}
    gon.description = {}
    @convos.each do |convo|
      gon.coordinates[convo.id] = [convo.latitude, convo.longitude]
      gon.category[convo.id] = convo.categories[0].cat_name
      gon.description[convo.id] = convo.description
    end

    render :map, layout: "map"
  end

end
