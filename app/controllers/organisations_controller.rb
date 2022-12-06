class OrganisationsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  # GET /organisations
  def index
    authorize @organisations = Organisation.all
  end

  # GET /organisations/1
  def show
    organisation
  end

  # GET /organisations/new
  def new
    authorize @organisation = Organisation.new
  end

  # POST /organisations
  def create
    authorize @organisation = Organisation.new(organisation_params)

    if organisation.save
      redirect_to organisation, notice: "Organisation was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /organisations/1/edit
  def edit
    organisation
  end

  # PATCH/PUT /organisations/1
  def update
    if organisation.update(organisation_params)
      redirect_to @organisation, notice: "Organisation was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /organisations/1
  def destroy
    organisation.destroy!
    redirect_to organisations_url, notice: "Organisation was successfully destroyed."
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def organisation
    @organisation ||= authorize Organisation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def organisation_params
    params.require(:organisation).permit(:name)
  end
end
