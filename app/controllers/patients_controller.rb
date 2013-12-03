class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.json
  def index
    @user = current_user
    @patients = @user.patients

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @user = current_user
    @patient = @user.patients.find(params[:id])
    @invoices = @patient.invoices

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @user = current_user
    @patient = @user.patients.new
    @insurances = Insurance.all


  end

  # GET /patients/1/edit
  def edit 
    @user = current_user
    @patient = @user.patients.find(params[:id])
    @insurances = Insurance.all
  end

  # POST /patients
  # POST /patients.json
  def create
    @user = current_user
    @patient = @user.patients.new(params[:patient])
    @insurance = Insurance.find(params[:insurance_id])
    @patient.insurance = @insurance

    respond_to do |format|
      if @patient.save
        format.html { redirect_to user_patients_url(@user), notice: 'Patient was successfully created.' }
        format.json { render json: @user.patients, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @user = current_user
    @patient = @user.patients.find(params[:id])
    @insurance = Insurance.find(params[:insurance_id])
    @patient.insurance = @insurance

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to user_patients_url(@user), notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @user = current_user
    @patient = @user.patients.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to user_patients_url(@user) }
      format.json { head :no_content }
    end
  end

  def flag
    @user = current_user
    @patient = @user.patients.find(params[:id])

    if @patient.flaged == true
      @patient.flaged = false
    else
      @patient.flaged = true
    end

    @patient.save

    respond_to do |format|
      format.html { redirect_to user_patients_url(@user) }
      format.json { head :no_content }
    end
  end
end

