class SoftwareInstancesController < ApplicationController
  before_action :set_software_instance, only: %i[ show edit update destroy ]

  # GET /software_instances
  def index
    @software_instances = SoftwareInstance.all
  end

  # GET /software_instances/1
  def show
  end

  # GET /software_instances/new
  def new
    @software_instance = SoftwareInstance.new
  end

  # GET /software_instances/1/edit
  def edit
  end

  # POST /software_instances
  def create
    @software_instance = SoftwareInstance.new(software_instance_params)

    if @software_instance.save
      redirect_to @software_instance, notice: "Software instance was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /software_instances/1
  def update
    if @software_instance.update(software_instance_params)
      redirect_to @software_instance, notice: "Software instance was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /software_instances/1
  def destroy
    @software_instance.destroy
    redirect_to software_instances_url, notice: "Software instance was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_software_instance
      @software_instance = SoftwareInstance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def software_instance_params
      params.require(:software_instance).permit(:name, :organisation_id, :organisation_group, :team, :owner, :product, :provider, :provider_contact, :version, :description, :status, :internal, :license, :quantity_purchased, :quantity_used)
    end
end
