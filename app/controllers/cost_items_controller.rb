class CostItemsController < ApplicationController

  # GET /cost_items
  # GET /cost_items.json
  def index
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.find(params[:invoice_id])
    redirect_to user_patient_invoice_path(@user,@patient,@invoice)
  end

  # GET /cost_items/1
  # GET /cost_items/1.json
  def show
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.find(params[:invoice_id])
    @cost_item = CostItem.find(params[:id])

    redirect_to user_patient_invoice_cost_item_path(@user,@patient,@invoice,@cost_item)
  end

  # GET /cost_items/new
  # GET /cost_items/new.json
  def new
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.find(params[:invoice_id])
    @cost_types = CostType.all
    @cost_item = CostItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cost_item }
    end
  end

  # GET /cost_items/1/edit
  def edit
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.find(params[:invoice_id])
    @cost_item = CostItem.find(params[:id])
    @cost_types = CostType.all

  end

  # POST /cost_items
  # POST /cost_items.json
  def create
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.find(params[:invoice_id])
    @cost_item = CostItem.new(params[:cost_item])
    @cost_item.costType = CostType.find(params[:costType_id])
    @cost_item.invoice = @invoice

    respond_to do |format|
      if @cost_item.save
        format.html { redirect_to user_patient_invoice_cost_items_url(@user,@patient,@invoice), notice: 'Cost item was successfully created.' }
        format.json { render json: @cost_item, status: :created, location: user_patient_invoice_cost_items_path(@user,@patient,@invoice) }
      else
        format.html { render action: "new" }
        format.json { render json: @cost_item.errors, status: :unprocessable_entity }
      end
    end
    calculate_costitem_amount(@cost_item)
    calculate_invoice_sum(@invoice)
  end

  # PUT /cost_items/1
  # PUT /cost_items/1.json
  def update
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.find(params[:invoice_id])
    @cost_item = CostItem.find(params[:id])
    @cost_item.costType = CostType.find(params[:costType_id])
    @cost_item.invoice = @invoice


    respond_to do |format|
      if @cost_item.update_attributes(params[:cost_item])
        format.html { redirect_to user_patient_invoice_cost_items_url(@user,@patient,@invoice),notice: 'Cost item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cost_item.errors, status: :unprocessable_entity }
      end
    end
    calculate_costitem_amount(@cost_item)
    calculate_invoice_sum(@invoice)
  end

  # DELETE /cost_items/1
  # DELETE /cost_items/1.json
  def destroy
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.find(params[:invoice_id])
    @cost_item = CostItem.find(params[:id])
    @cost_item.destroy

    respond_to do |format|
      format.html { redirect_to user_patient_invoice_cost_items_url(@user,@patient,@invoice) }
      format.json { head :no_content }
    end
    calculate_costitem_amount(@cost_item)
    calculate_invoice_sum(@invoice)
  end
end
