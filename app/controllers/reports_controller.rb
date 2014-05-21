# Handles HTTP requests for Reports
class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  # Support for the following requests:
  # * GET /reports
  # * GET /reports.json
  def index
    if current_user.admin? == false
      @blocks = Block.where(:user_id => current_user.id)
      @user_reports = Array.new
      for block in @blocks
         @user_reports << block.block_number
      end
      @reports = Report.where(:block_number => @user_reports)
      @reports = @reports.order(sort_column + " " + sort_direction)
    else
      @reports = Report.all
      @reports = @reports.order(sort_column + " " + sort_direction)
    end

    respond_to do |format|
      format.html
      format.csv { send_data @reports.to_csv }
      format.xls #{ send_data @reports.to_csv(col_sep: "\t") }
    end
  end

  # Support for the following requests:
  # * GET /reports/1
  # * GET /reports/1.json
  def show
  end

  # Support for the following requests:
  # * GET /reports/new
  def new
    if current_user.blocks.count == 0
      redirect_to blocks_url, notice: 'Please register a block first.'
    end
    @report = Report.new
    @report.block_id = session[:block_id]
    @report.date = session[:date]
    session[:report_params] ||= {}
    Block.where(:user_id => current_user.id)

    session[:report_params].deep_merge!(params[:report]) if params[:report]
    @report = Report.new(session[:report_params])
    session[:date] = @report.date
    session[:block_id] = @report.block_id
    @report.current_step = session[:report_step]

    if params[:back_button]
      @report.previous_step
    elsif @report.last_page?
      #@report.save
    else
      @report.next_step
    end

    session[:report_step] = @report.current_step
  end

  # Support for the following requests:
  # * GET /reports/1/edit
  def edit
  end

  # Support for the following requests:
  # * POST /reports
  # * POST /reports.json
  def create
    session[:report_params].deep_merge!(params[:report]) if params[:report]

    @report = Report.new(session[:report_params])
    session[:date] = @report.date
    session[:block_id] = @report.block_id
    @report.current_step = session[:report_step]
    
    if params[:back_button]
      @report.previous_step
    elsif @report.last_page?
      @report.save
    else
      @report.next_step
    end
   
    session[:report_step] = @report.current_step
    
    if @report.new_record?
      render "new"
    else
      session[:report_step] = session[:report_params] = nil
      flash[:success] = "Report saved"
      redirect_to @report
    end
  end
   
  

  # Support for the following requests:
  # * PATCH/PUT /reports/1
  # * PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # Support for the following requests:
  # * DELETE /reports/1
  # * DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:activity, :block_id, :comment, :date, :image, :plug_state, :plug_type, :pluga, :plugn)
    end

    def sort_column
      Report.column_names.include?(params[:sort]) ? params[:sort] : "date"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
