class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]
  before_action :has_access
  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end
  def has_access
    if current_user
      if current_user.employee|| current_user.is_admin
      else
        respond_to do |format|
          format.html { redirect_to root_path, notice: "You need to be sign in as an Employee to create an Intervention!" }
        end
      end    
    else
      respond_to do |format|
        format.html { redirect_to (root_path + 'users/sign_in'), notice: "You need to be sign in as an Employee !" }
      end
    end        
  end
  
  # GET /interventions/1 or /interventions/1.json
  def show
  end
  def create

    @intervention = Intervention.new(intervention_params)

    if current_user.employee

      @intervention.author_id = Employee.where(user_id: current_user.id)[0].id
      
    else

      @intervention.author_id = 0
      
    end 
    # @intervention.result = 'Incomplete'
    # @intervention.status = 'Pending'
    # @intervention.start_date = 'null'
    # @intervention.end_date = 'null'
    # @intervention.valid?
    # if @intervention.elevator_id
    #     @intervention.battery_id= ''
    #     @intervention.column_id= ''
    # elsif @intervention.column_id
    #   @intervention.battery_id= ''
    #   @intervention.elevator_id= ''
    # elsif @intervention.battery_id  
    #   @intervention.column_id= ''
    #   @intervention.elevator_id= ''
    # end

    @intervention.save

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to (rails_admin_path + "/intervention/#{@intervention.id}"), notice: "Intervention was successfully created." }
      else
        for msg in @intervention.errors.full_messages do
          if msg == "Author must exist"
            msg = "You must be log in has an Employee to register an Intervention."
          end
          flash[:notice] = "#{msg}"  
        end
        format.html {render :new}
      end
    end
  end 
  # GET /interventions/new
  def new
    @intervention = Intervention.new
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  # def create
  #   @intervention = Intervention.new(intervention_params)

  #   respond_to do |format|
  #     if @intervention.save
  #       format.html { redirect_to @intervention, notice: "Intervention was successfully created." }
  #       format.json { render :show, status: :created, location: @intervention }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @intervention.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:author_id, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_date, :end_date, :result, :report, :status)
    end
end