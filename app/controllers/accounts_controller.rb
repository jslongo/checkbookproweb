class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    begin_date = params[:begin_date]
    end_date = params[:end_date]
    if (!begin_date)
      begin_date = DateTime.now.beginning_of_month
    end
    if (!end_date)
      end_date = begin_date.end_of_month
    end
    @account = Account.find(params[:id])
    @transactions = Transaction.find(:all, :conditions => ["account_id = ? AND transaction_date >= ? AND transaction_date <= ?", params[:id], begin_date, end_date],  :order => "transaction_date, itemno")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
      format.json { render :json => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end
  
  def since
    @account = Account.find(params[:id])
    @transactions = Transaction.find(:all, :conditions => ["account_id = ? AND transaction_date >= ?", params[:id], params[:date]])

    respond_to do |format|
      format.html # since.html.erb
      format.xml  { render :xml => @transactions }
      format.json  { render :json => @transactions }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end
end
