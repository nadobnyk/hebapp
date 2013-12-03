class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.json
  def index
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    redirect_to user_patient_path(@user,@patient)
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.find(params[:id])
    @cost_items=@invoice.costItems
        
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.find(params[:id])
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.new(params[:invoice])
    @invoice.insurance_id = @patient.insurance.id
    @invoice.sum = 0
    
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to user_patient_invoice_path(@user, @patient, @invoice), notice: 'Invoice was successfully created.' }
        format.json { render json: user_patient_invoice_path(@user, @patient, @invoice), status: :created, location: @invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.find(params[:id])
    @invoice.insurance_id = @patient.insurance.id

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to user_patient_invoice_path(@user, @patient, @invoice), notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: user_patient_invoice_path(@user, @patient, @invoice).errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to user_patient_invoices_url }
      format.json { head :no_content }
    end
  end
  
  # GET /invoices/1/export
  def export
    @user = current_user
    @patient = @user.patients.find(params[:patient_id])
    @invoice = @patient.invoices.find(params[:invoice_id])
    @insurance = @patient.insurance
    @export = @invoice.exports.new

    tempfile = Tempfile.new("")
    

    #beginn nutzungsdatei+Codierung:Version+SenderIK(erste 9 stellen)+EmpfängerIK(erste 9 stellen)+JJJJMMTT:HHMM+datenaustauschreferenz+Leistungsbereich(50=Hebammen)+Anwendungsreferenz+Testindikator 
    @testindikator = 0 #0=test, 1=erprobung, #2=echtdatei
      
      #berechne datenaustauschreferenz
      @sum=1
      @insurance.patients.each do |patient|
        patient.invoices.each do |invoice|
          if invoice.exports != nil
            @sum = @sum+invoice.exports.count
          end
        end
      end
      @datenaustauschreferenz = @sum.to_s.rjust(5, '0');
      #setze zeitzone
      Time.zone = 'Berlin'
    
      #ermittle dateiname TODO
        #Kassenart|Verfahren|MonatundJahreszahl
      @dateiname="AA05#{@invoice.date.strftime("%m%y")}.KD0"
    tempfile.puts("UNB+UNOC:3+#{@user.ikNumber}+#{@insurance.number}+#{Time.current().strftime("%Y%m%d")}:#{Time.current().strftime("%H%M")}+#{@datenaustauschreferenz}+50+#{@dateiname}+#{@Testindikator}")
    

    #beginn nachricht
    tempfile.puts("UNH+SLLA:06:0:0")
    
    #FKT, REC, INV, NAD, IMG, HEB, HEL, EHB, TXT, MWS, ZHB, DIA, SKZ, BES

    #ende nachricht
    tempfile.write("UNT")
    

    #ende nutzungsdatei
    tempfile.write("UNZ")
    

    tempfile.close
    @export.exported_file = File.open(tempfile.path)
    @export.save
    @invoice.save

    send_file @export.exported_file.path, :filename => @dateiname

    flash[:notice] = "Die Rechnung wurde erfolgreich exportiert"

  end 
end
