class InsurancesController < ApplicationController
  # GET /insurances
  # GET /insurances.json
  def index
    @insurances = Insurance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @insurances }
    end
  end

  # GET /insurances/1
  # GET /insurances/1.json
  def show
    @insurance = Insurance.find(params[:id])
    @invoices =Array.new
    @user=current_user
    current_user.patients.each do |patient|
      if patient.insurance == @insurance
        patient.invoices.each do |invoice|
          @invoices.push invoice
        end  
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @insurance }
    end
  end

  # GET /insurances/new
  # GET /insurances/new.json
  def new
    @insurance = Insurance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @insurance }
    end
  end

  # GET /insurances/1/edit
  def edit
    @insurance = Insurance.find(params[:id])
  end

  # POST /insurances
  # POST /insurances.json
  def create
    @insurance = Insurance.new(params[:insurance])

    respond_to do |format|
      if @insurance.save
        format.html { redirect_to @insurance, notice: 'Insurance was successfully created.' }
        format.json { render json: @insurance, status: :created, location: @insurance }
      else
        format.html { render action: "new" }
        format.json { render json: @insurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /insurances/1
  # PUT /insurances/1.json
  def update
    @insurance = Insurance.find(params[:id])

    respond_to do |format|
      if @insurance.update_attributes(params[:insurance])
        format.html { redirect_to @insurance, notice: 'Insurance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @insurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurances/1
  # DELETE /insurances/1.json
  def destroy
    @insurance = Insurance.find(params[:id])
    @insurance.destroy

    respond_to do |format|
      format.html { redirect_to insurances_url }
      format.json { head :no_content }
    end
  end
end
