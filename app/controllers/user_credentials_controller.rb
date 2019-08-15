class UserCredentialsController < ApplicationController
  # before_action :set_person, only: [:show, :edit, :update, :destroy]

  #region actions with views
  def index
    @admins = Admin.joins(person: :user)
  end

  def new
    @admin = Admin.new
    person = @admin.build_person
    person.build_user
  end

  def edit ;end
  #endregion

  #region logical actions
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to user_credentials_path, notice: 'Admin was successfully created.' }
      else
        # person = @admin.build_person
        unless @admin.person.user
          @admin.person.build_user
        end
        format.html { render :new }
      end
    end
  end

  def update ;end

  def destroy ;end
  #endregion

  private
  def set_person
    @person = Person.find(params[:id])
    @user = @person.user
  end

  def admin_params
    params.require(:admin)
        .permit(:token, :id,
                person_attributes: [
                    :id,:name,:last_name,:ci,:phone_number,:address,:birthday,
                    user_attributes: [:id,:email,:password,:password_confirmation]
                ])
  end

end
