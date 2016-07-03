class FamilyRelationsController < ApplicationController
  before_action :set_family_relation, only: [:show, :edit, :update, :destroy]

  # GET /family_relations
  # GET /family_relations.json
  def index
    @profile = current_user.profile
    @family_members = @profile.family_relations
    # @family_relations = Profile.where(id: current_user.family_members.pluck(:member_id))
    # @family_relations = FamilyRelation.all
  end

  # GET /family_relations/1
  # GET /family_relations/1.json
  def show
  end

  # GET /family_relations/new
  def new
    @family_relation = FamilyRelation.new
  end

  # GET /family_relations/1/edit
  def edit
  end

  # POST /family_relations
  # POST /family_relations.json
  def create
    @family_relation = FamilyRelation.new(family_relation_params)

    respond_to do |format|
      if @family_relation.save
        format.html { redirect_to @family_relation, notice: 'Family relation was successfully created.' }
        format.json { render :show, status: :created, location: @family_relation }
      else
        format.html { render :new }
        format.json { render json: @family_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /family_relations/1
  # PATCH/PUT /family_relations/1.json
  def update
    respond_to do |format|
      if @family_relation.update(family_relation_params)
        format.html { redirect_to @family_relation, notice: 'Family relation was successfully updated.' }
        format.json { render :show, status: :ok, location: @family_relation }
      else
        format.html { render :edit }
        format.json { render json: @family_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family_relations/1
  # DELETE /family_relations/1.json
  def destroy
    @family_relation.destroy
    respond_to do |format|
      format.html { redirect_to family_relations_url, notice: 'Family relation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_relation
      @family_relation = FamilyRelation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_relation_params
      params.require(:family_relations).permit(:family_name,:family_image,:family_age,:family_dob,:family_gender,:family_blood_group,:family_relationship,:family_education,:family_occupation)
    end
end
