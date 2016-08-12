class PersonController < ApplicationController
  def new
    @kind = Person.new
  end

  def show
    @person = current_person_by_user
  end

  def create
    p current_user
    p "*"*90
    p info_params
    @person = Person.new(info_params)
    if @person.save
      redirect_to current_user
    end
  end

private
  def current_person_by_user
    current_user.person
  end

  def info_params #parámetros fuertes para evitar la vulnerabilidad de asignación de masas 
      params.require(:person).permit(:name, :lastname, :born, :ocupation, 
                                   :soc_stat, :page, :description, :user_id)
  end
end
