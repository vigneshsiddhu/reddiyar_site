class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :search]
  before_action :authenticate_user!
  before_filter :set_paper_trail_whodunnit
  layout 'profile'
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])
    @profiles = Profile.where.not(user_id: current_user.id)
  end
  
  def search
    @profiles = Profile.where("name LIKE ?", "%#{params["name"]}%")
  end

  def unverified_profiles
    if (current_user.user_roles.pluck(:role) & [0,1,3]).any?
      @profiles = Profile.where(verified: false)
    else
      return false
    end
  end

  def family_list
    @family = []
    family = current_user.profile.family_members
    profile = Profile.where(id: family.pluck(:member_id))
    family.each_with_index do |fam, i|
      member = {
        'name' => profile[i].name,
        'email' =>  profile[i].user.email,
        'relationship' => fam.relationship,
        'gender' => profile[i].gender,
        'dob' => profile[i].dob, 
        'image' => profile[i].image
      }
      @family << member
    end
  end

  def verify_profile
    profile = Profile.find(params[:profile_id])
    @status = Profile.verify_profile(profile)
    redirect_to admin_unverified_profiles_path
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    @profile = current_user.profile
    @profiles = Profile.where.not(user_id: current_user.id)
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = current_user.profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name, :mobile, :dob, :gender, :caste, :blood_group, :marital_status, :height, :weight, :image, family_members_attributes:[:member_id, :relationship, :id, :_destroy], educations_attributes:[:institution, :year_of_completion, :type_of_education, :city, :id, :_destroy], locations_attributes:[:pin_code, :city, :district, :address, :address_type, :id, :_destroy], occupations_attributes:[:organisation, :category, :position, :id, :_destroy])
    end
end
