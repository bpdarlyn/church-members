class UserCredentialsController < ApplicationController
  # before_action :set_person, only: [:show, :edit, :update, :destroy]

  #region actions with views
  def index ;end

  def new ;end

  def edit ;end
  #endregion

  #region logical actions
  def create ;end

  def update ;end

  def destroy ;end
  #endregion

  private
  def set_person
    @person = Person.find(params[:id])
    @user = @person.user
  end

  def person_params
    params.require(:person).permit(:name, :last_name,:ci,:phone_number,:address,:birthday, user_attributes: [:id,:email,:password,:password_confirmation])
  end

end
