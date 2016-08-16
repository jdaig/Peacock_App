class RelationController < ApplicationController
  def new
    @kind = Relation.new
  end

  def show
    #en el view hay que redireccionarlo a repute, o ratyrate
  end

  def create
    @person = Relation.new(rela_params)
    if @person.save
      current_user_topic #recuerda ver si es person o company
    else
      render 'new'
    end
  end

  def edit
    # @person = current_person_by_user
  end

  def update
    @person = current_person_by_user
    if @person.update(info_params)
      flash[:success] = "Profile updated"
      redirect_to @person
    else
      render 'edit'
    end
  end

  def index
    #aqui se pondra los repute
  end

private
  def current_user_topic
    if current_user.company
      redirect_to company_index_path
    else
      redirect_to person_index_path
    end
  end

  def rela_params #parámetros fuertes para evitar la vulnerabilidad de asignación de masas 
      params.require(:relation).permit(:sudo, :company_id, :person_id)
  end
end
