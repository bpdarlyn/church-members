class PeopleController < ApplicationController
  # before_action :set_person, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  #region actions with views
  def index
    @title_breadcrum = "Persona"
    if params[:filter_code]
      @title_obtained = TitleObtained.find_by_code(params[:filter_code])
      if @title_obtained
        @people = @people.joins(my_titles: :title_obtained)
                      .where("title_obtaineds.code = ? and my_titles.active = true", params[:filter_code])
      end
    end

    if current_user.is?(:churchman)
      @people = @people.where(person_id: current_user.person.id)
    end

  end

  def new
    TitleObtained.all.each do |title_obtained|
      title = @person.my_titles.build
      title.title_obtained = title_obtained
    end
    @people = Person.all
  end

  def edit
    @people = Person.all
    unless @person.my_titles.any?
      TitleObtained.all.each do |title_obtained|
        title = @person.my_titles.build
        title.title_obtained = title_obtained
        title.save
      end
    end
  end

  #endregion

  #region logical actions
  def create
    @person = Person.new(person_params)
    TitleObtained.all.each do |title_obtained|
      new_title = @person.my_titles.build
      new_title.title_obtained = title_obtained
      new_title.active = params[:title_obtained_id].to_i === title_obtained.id
      new_title.title_date = Date.today
    end

    respond_to do |format|
      if @person.save
        format.html {redirect_to people_path, notice: 'Person was successfully created.'}
      else
        format.html {render :new}
      end
    end
  end

  def update
    @person.my_titles.where(active: true).update_all(active: false)
    respond_to do |format|
      if @person.update(person_params)
        active_new_title = @person.my_titles.where(title_obtained_id: params[:title_obtained_id]).first
        if active_new_title
          active_new_title.title_date = Date.today
          active_new_title.active = true
          active_new_title.save
        end
        format.html {redirect_to people_path, notice: 'Person was successfully updated.'}
      else
        @people = Person.all
        format.html {render :edit}
      end
    end
  end

  def destroy;
  end

  #endregion

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params_with_leader = params.require(:person)
                             .permit(:name, :last_name, :address, :birthday, :phone_number, :ci, :sex, :person_id)
    unless current_user.is?(:admin)
      params_with_leader = params_with_leader.merge({person_id: current_user.person_id})
    end
    params_with_leader

  end

end
