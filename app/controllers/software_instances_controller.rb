class SoftwareInstancesController < ApplicationController
  before_action :organisation

  def index
    @software_instances = organisation.software_instances
  end

  def show
    software_instance
  end

  def new
    @software_instance = organisation.software_instances.build
  end

  def create
    @software_instance = organisation.software_instances.build(software_instance_params)

    if software_instance.save
      redirect_to software_instance, notice: "Software instance was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    software_instance
  end

  def update
    if software_instance.update(software_instance_params)
      redirect_to software_instance, notice: "Software instance was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    software_instance.destroy!
    redirect_to organisation_software_instances_path(organisation), notice: "Software instance was successfully destroyed."
  end

private

  def software_instance
    @software_instance ||= SoftwareInstance.find(params[:id])
  end

  def organisation
    @organisation ||= if params[:organisation_id].present?
                        Organisation.find(params[:organisation_id])
                      else
                        software_instance.organisation
                      end
  end

  # Only allow a list of trusted parameters through.
  def software_instance_params
    params.require(:software_instance).permit(:name, :organisation_id, :organisation_group, :team, :owner, :product, :provider, :provider_contact, :version, :description, :status, :internal, :license, :quantity_purchased, :quantity_used)
  end
end
