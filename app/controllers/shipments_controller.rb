# app/controllers/shipments_controller.rb
class ShipmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!
  before_action :set_shipment, only: [:show, :edit, :update, :destroy]
  
  def index
    if current_user.admin?
      @shipments = Shipment.all
    elsif current_user.delivery_partner?
      @shipments = Shipment.where(delivery_partner: current_user)
    else
      @shipments = current_user.shipments
    end
  end

  def new
    @shipment = current_user.shipments.build
  end

  def show
    unless current_user.admin?
      redirect_to shipments_path, alert: "Access denied." unless @shipment.user == current_user
    end
  end

  def create
    @shipment = current_user.shipments.build(shipment_params)
    if @shipment.save
      redirect_to shipments_path, notice: 'Shipment was successfully created.'
    else
      render :new
    end
  end

  def edit
    if current_user.admin?
      @shipment = Shipment.find(params[:id])
    elsif current_user.delivery_partner?
      @shipments = Shipment.where(delivery_partner: current_user)
    else
     @shipment = current_user.shipments.find(params[:id])
    end
  end

  def update
    if current_user.admin?
      @shipment = Shipment.find(params[:id])
    elsif current_user.delivery_partner?
      @shipments = Shipment.where(delivery_partner: current_user)
    else
      @shipment = current_user.shipments.find(params[:id])
    end
    if @shipment.update(shipment_params)
      redirect_to shipments_path, notice: 'Shipment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if current_user.admin?
      @shipment = Shipment.find(params[:id])
    else
      @shipment = current_user.shipments.find(params[:id])
    end
    @shipment.destroy
    redirect_to shipments_path, notice: 'Shipment was successfully destroyed.'
  end

  private

  def shipment_params
    params.require(:shipment).permit(:source_location, :target_location, :item, :status,:delivery_partner_id)
  end

  def set_shipment
    @shipment = Shipment.find(params[:id])
  end
end
