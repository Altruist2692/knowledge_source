class PocsController < ApplicationController

  before_action :assign_poc, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @poc = current_user.pocs.build
  end

  def create
    @poc = current_user.pocs.new(poc_params.merge!(revision_number: 1, source_code: params[:poc][:source_code]))
    if @poc.save
      if params[:poc][:document] && params[:poc][:document][:file]
        params[:poc][:document][:file].each do |file|
          @poc.documents.create(file: file)
        end
      end
      flash[:success] = "POC added successfully."
      redirect_to pocs_path
    else
      flash[:error] = @poc.errors.full_messages
      render :new
    end
  end

  def index
    @pocs = current_user.pocs.includes(:languages, :tags)
  end

  def edit
  end

  def update
    new_revision_number = update_revision_number
    if @poc.update_attributes(poc_params.merge!(revision_number: new_revision_number))
      flash[:success] = "Poc details updated successfully."
      redirect_to pocs_path
    else
      flash[:danger] = @poc.errors.full_messages
      render :edit
    end
  end

  def show
    @poc = Poc.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @poc.destroy
      flash[:success] = "POC removed successfully"
    else
      flash[:danger] = "Unable to remove POC. Something went wrong."
    end
    redirect_to pocs_path
  end

  def clear_flash
    flash.clear
    @messages = nil
    @name = nil
    render nothing: true
  end
  private

  def assign_poc
    @poc ||= Poc.find(params[:id])
  end

  def poc_params
    params.require(:poc).permit(:name,
                                :start_poc_at,
                                :end_poc_at,
                                :description,
                                :revision_number,
                                :revision_note,
                                :key_features,
                                :tag_list,
                                :source_code,
                                documents: {}


    )
  end

  def update_revision_number
    @poc.revision_number += 1
  end
end