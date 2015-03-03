class VendorsController < ApplicationController

  before_filter :authenticate_user!

  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  def index
    @vendors = Vendor.all
    @hash = Gmaps4rails.build_markers(@vendors) do |vendor, marker|
      marker.lat vendor.latitude
      marker.lng vendor.longitude
      marker.infowindow "<h1 class='vendor-title'>" + vendor.title + "</h1>" + "<br>" + 
        "<img src='#{vendor.picture}' class='info-image'>" + "<br>" + "<div class='vendor-description'>" + vendor.description + "<br>" + "Categories:  " + vendor.categories.map(&:name).join(', ')
    end
  end

  def show
  end

  def new
    @vendor = Vendor.new
  end

  def edit
  end

  def create
    @vendor = Vendor.new(vendor_params)

    if @vendor.save
      redirect_to @vendor, notice: 'Vendor was successfully created.' 
    else
      render :new
    end

  end

  def update
    @vendor.parish=params[:parish]
    @vendor.category_ids=params[:vendor][:category_ids]

    if @vendor.update(vendor_params)
      redirect_to @vendor, notice: "Vendor was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @vendor.destroy
    redirect_to vendors_url, notice: "Vendor was successfully deleted"
  end

  private
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    def vendor_params
      params.require(:vendor).permit(:latitude, :longitude, :title, :address, :parish, :postcode, :description, :picture, :contact_name, :contact_tel, :contact_email, :category_id => [])
    end
end
