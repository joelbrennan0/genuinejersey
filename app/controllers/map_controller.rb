class MapController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:parish => user.parish})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "<br>" + "Categories:  " + user.categories.map(&:name).join(', ')
   end

   @sth = Gmaps4rails.build_markers(@users.where(:parish => "Saint Helier")) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:parish => user.parish})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "</div><br>" + "Categories:  " + user.categories.map(&:name).join(', ')
  end

  @stj = Gmaps4rails.build_markers(@users.where(:parish => "St John")) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:parish => user.parish})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "<br>" + "Categories:  " + user.categories.map(&:name).join(', ')
  end

  @sta = Gmaps4rails.build_markers(@users.where(:parish => "St Mary")) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:parish => user.parish})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "<br>" + "Categories:  " + user.categories.map(&:name).join(', ')
  end

  @stb = Gmaps4rails.build_markers(@users.where(:parish => "St Brelade")) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:parish => user.parish})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "<br>" + "Categories:  " + user.categories.map(&:name).join(', ')
  end

  @stm = Gmaps4rails.build_markers(@users.where(:parish => "St Martin")) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:parish => user.parish})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "<br>" + "Categories:  " + user.categories.map(&:name).join(', ')
  end

  @sto = Gmaps4rails.build_markers(@users.where(:parish => "St Ouen")) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:parish => user.parish})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "<br>" + "Categories:  " + user.categories.map(&:name).join(', ')
  end

  @stp = Gmaps4rails.build_markers(@users.where(:parish => "St Peter")) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:parish => user.parish})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "<br>" + "Categories:  " + user.categories.map(&:name).join(', ')
  end

  @sts = Gmaps4rails.build_markers(@users.where(:parish => "St Saviour")) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:parish => user.parish})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "<br>" + "Categories:  " + user.categories.map(&:name).join(', ')
  end

  @stc = Gmaps4rails.build_markers(@users.where(:parish => "St Clement")) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:parish => user.parish})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "<br>" + "Categories:  " + user.categories.map(&:name).join(', ')
  end

  @stl = Gmaps4rails.build_markers(@users.where(:parish => "St Lawrence")) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:parish => user.parish})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "<br>" + "Categories:  " + user.categories.map(&:name).join(', ')
  end

  @tri = Gmaps4rails.build_markers(@users.where(:parish => "Trinity")) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:parish => user.parish})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "<br>" + "Categories:  " + user.categories.map(&:name).join(', ')
  end

  @gro = Gmaps4rails.build_markers(@users.where(:parish => "Grouville")) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:parish => user.parish})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "<br>" + "Categories:  " + user.categories.map(&:name).join(', ')
  end



if params[:user].present?

    @category_select = Gmaps4rails.build_markers(@users.where(params[:user][:category_ids]  => @users.category_ids)) do |user, marker| 
    marker.lat user.latitude
    marker.lng user.longitude
    marker.json({:categories => user.categories})
    marker.infowindow "<h1 class='user-title'>" + user.title + "</h1>" + "<br>" + 
    "<img src='#{user.picture}' class='info-image'>" + "<br>" + "<div class='user-description'>" + user.description + "<br>" + "Categories:  " + user.categories.map(&:name).join(', ')

   end
 end
  
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.category_ids=params[:user][:category_ids]
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:latitude, :longitude, :title, :address, :parish, :postcode, :description, :picture, :name, :category_ids, :user_categories, :category_ids => []) #:category
    end
end

