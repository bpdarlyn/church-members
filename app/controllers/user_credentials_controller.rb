class UserCredentialsController < ApplicationController
  before_action :set_church_man, only: [:show, :edit, :update, :destroy]

  #region actions with views
  def index
    @church_man = ChurchMan.joins(person: :user)
  end

  def new
    @church_men = ChurchMan.new
    person = @church_men.build_person
    person.build_user
  end

  def edit
  end

  #endregion

  #region logical actions
  def create
    @church_men = ChurchMan.new(church_params)

    respond_to do |format|
      if @church_men.save
        format.html {redirect_to user_credentials_path, notice: 'Church Man was successfully created.'}
      else
        # person = @admin.build_person
        unless @church_men.person.user
          @church_men.person.build_user
        end
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @church_men.update(church_params)
        format.html {redirect_to user_credentials_path, notice: 'Church Man was successfully updated.'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy;
  end

  def new_with_linked_person
    @user = User.new
    @people = Person.all
  end

  def create_with_linked_person
    #
    @user = User.new(user_params)
    @user.person = @person
    respond_to do |format|
      if @user.valid?
        church_men = ChurchMan.new(person: @person)
        if church_men.valid?
          church_men.save
          format.html {redirect_to user_credentials_path, notice: 'Church Man was successfully updated.'}
        else
          format.html {render :new_with_linked_person}
        end
      else
        @people = Person.all
        format.html {render :new_with_linked_person}
      end
    end
  end

  #endregion

  private

  def user_params
    @person = Person.find(params[:person_id])
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_church_man
    @church_men = ChurchMan.find(params[:id])
  end

  def church_params
    params.require(:church_man)
        .permit(:token, :id,
                person_attributes: [
                    :id, :name, :last_name, :ci, :phone_number, :address, :birthday,:sex,
                    user_attributes: [:id, :email, :password, :password_confirmation]
                ])
  end


end
