class MapController < ApplicationController
	
  def index

    # Filter vendors to make sure we only return those that have marker details
    @vendors = Vendor.where.not(latitude: nil)

    if params[:parish].present?
      @vendors = @vendors.where(parish: params[:parish])
    end

    if params[:category_id].present?
      @vendors = @vendors.joins(:categories).where(categories: {id: params[:category_id]} )
    end

    @hash = Gmaps4rails.build_markers(@vendors) do |vendor, marker| 
      marker.lat vendor.latitude
      marker.lng vendor.longitude
      marker.json({:parish => vendor.parish})
      marker.infowindow "<h1 class='vendor-title'>" + vendor.title + "</h1>" + "<br>" + 
      "<img src='#{vendor.picture}' class='info-image'>" + "<br>" + "<div class='vendor-description'>"  + vendor.description + "<br>" + "Categories:  " + vendor.categories.map(&:name).join(', ')
     end

  end

  # # GET /users/1
  # # GET /users/1.json
  # def show
  # end

  # # GET /users/new
  # def new
  #   @user = User.new
  # end

  # # GET /users/1/edit
  # def edit
  # end

  # # POST /users
  # # POST /users.json
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: 'User was successfully created.' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  # def update
  #   @user.category_ids=params[:user][:category_ids]
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /users/1
  # # DELETE /users/1.json
  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_user
  #     @user = User.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def user_params
  #     params.require(:user).permit(:latitude, :longitude, :title, :address, :parish, :postcode, :description, :picture, :name, :category_ids, :user_categories, :category_ids => []) #:category
  #   end
end

