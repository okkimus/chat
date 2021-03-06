class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy, :join, :rooms_messages, :authentication]
  before_action :authenticate, only:  [:destroy]
  before_action :redirect_if_not_logged, only: [:show, :edit, :update, :join, :new, :create]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    if @room.privacy
      render :authentication
    end
    @message = Message.new
  end

  def authentication
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @rooms }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    @user = User.find(session[:user_id])
    @room.users << @user
    redirect_to @room
  end

  def rooms_messages
    @messages = @room.messages.last(20)
    #respond_to do |format|
    #  format.json { render json: @messages, status: :unprocessable_entity }
    #end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :password, :privacy)
    end

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "admin" and password == "secret"
      end
    end

    def redirect_if_not_logged
      redirect_to rooms_path, notice: 'Signin first!' if not current_user
    end
end
