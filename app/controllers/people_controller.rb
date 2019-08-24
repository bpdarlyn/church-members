class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  #region actions with views
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def edit
  end

  #endregion

  #region logical actions
  def create
    @admin = Person.new(person_params)

    respond_to do |format|
      if @admin.save
        format.html {redirect_to user_credentials_path, notice: 'Admin was successfully created.'}
      else
        # person = @admin.build_person
        unless @admin.person.user
          @admin.person.build_user
        end
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html {redirect_to user_credentials_path, notice: 'Admin was successfully updated.'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy;
  end

  #endregion

  private

  def set_person
    @admin = Admin.find(params[:id])
  end

  def person_params
    params.require(:person)
        .permit(:token, :id,
                person_attributes: [
                    :id, :name, :last_name, :ci, :phone_number, :address, :birthday,
                    user_attributes: [:id, :email, :password, :password_confirmation]
                ])
  end

end
