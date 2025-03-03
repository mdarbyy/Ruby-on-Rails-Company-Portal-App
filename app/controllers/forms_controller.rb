class FormsController < ApplicationController
  before_action :check_if_user_is_admin
  before_action :set_form, only: %i[ show edit update destroy ]

  # GET /forms or /forms.json
  def index
    @limit = Setting.first.entity_limit
    offset = params[:offset].to_i || 0
    @forms = Form.all.limit(@limit).offset(offset).order(updated_at: :desc, created_at: :desc)
    @total_records = Form.all.count

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /forms/1 or /forms/1.json
  def show
  end

  # GET /forms/new
  def new
    @form = Form.new
    @form.form_fields.build
  end

  # GET /forms/1/edit
  def edit
  end

  # POST /forms or /forms.json
  def create
    @form = Form.new(form_params)

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, success: "Form was created" }
        format.json { render :show, status: :created, location: @form }
      else
        flash[:danger] = @form.errors.full_messages.first
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1 or /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, success: "Form was updated" }
        format.json { render :show, status: :ok, location: @form }
      else
        flash[:danger] = @form.errors.full_messages.first
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1 or /forms/1.json
  def destroy
    @form.destroy

    respond_to do |format|
      format.html { redirect_to forms_path, status: :see_other, success: "Form was deleted" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    def check_if_user_is_admin
      unless current_user.isAdmin?
        redirect_to root_path, danger: "You are not authorized to view this page"
      end
    end

    # Only allow a list of trusted parameters through.
    def form_params
      params.require(:form).permit(:id, :name, :description, :status, :required_by, form_fields_attributes: [:id, :label, :description, :field_type, :_destroy])
    end
end
