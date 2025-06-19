class Admin::TestResultsController < Admin::ApplicationController
  before_action :set_admin_test_result, only: %i[ show edit update destroy ]

  # GET /admin/test_results or /admin/test_results.json
  def index
    @admin_test_results = Admin::TestResult.all
  end

  # GET /admin/test_results/1 or /admin/test_results/1.json
  def show
  end

  # GET /admin/test_results/new
  def new
    @admin_test_result = Admin::TestResult.new
  end

  # GET /admin/test_results/1/edit
  def edit
  end

  # POST /admin/test_results or /admin/test_results.json
  def create
    @admin_test_result = Admin::TestResult.new(admin_test_result_params)

    respond_to do |format|
      if @admin_test_result.save
        format.html { redirect_to @admin_test_result, notice: "Test result was successfully created." }
        format.json { render :show, status: :created, location: @admin_test_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_test_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/test_results/1 or /admin/test_results/1.json
  def update
    respond_to do |format|
      if @admin_test_result.update(admin_test_result_params)
        format.html { redirect_to @admin_test_result, notice: "Test result was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_test_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_test_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/test_results/1 or /admin/test_results/1.json
  def destroy
    @admin_test_result.destroy!

    respond_to do |format|
      format.html { redirect_to admin_test_results_path, status: :see_other, notice: "Test result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_test_result
      @admin_test_result = Admin::TestResult.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def admin_test_result_params
      params.expect(admin_test_result: [ :name, :sanguine, :choleric, :melancholic, :phlegmatic ])
    end
end
