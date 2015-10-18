class PocsController < ApplicationController

  before_action :assign_poc, only: [:edit, :update, :destroy]
  def new
    @poc = Poc.new
  end

  def create
    @poc = Poc.new(poc_params.merge!(revision_number: 1))
    if @poc.save
      flash[:sccess] = "POC added successfully."
      redirect_to pocs_path
    else
      flash[:danger] = @poc.errors.full_messages
      render :new
    end
  end

  def index
    @pocs = Poc.all
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

  end

  def destroy
    if @poc.destroy
      flash[:success] = "POC removed successfully"
    else
      flash[:danger] = "Unable to remove POC. Something went wrong."
    end
    redirect_to pocs_path
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
                                :source_code
    )
  end

  def update_revision_number
    @poc.revision_number += 1
  end
end