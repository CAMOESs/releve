class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
      @users = User.all.sort_by(&:id)
      #@users = User.all.sort_by(&:nom)
  end

  # GET /users/1 or /users/1.json
  def show
    @prenom = @user.prenom.split(' ')
    @prenom = @prenom.map { |e| e.capitalize  }
    @user.prenom = @prenom.join(' ')


    if @user.moderne == "moderne court"

      if @user.lecture == nil
        @user.lecture = 0
        @lect = 0
      else
        @lect = @user.lecture*2
      end

      if @user.commecri == nil
        @user.commecri = 0
        @com = 0
      else
        @com =@user.commecri*2
      end

      if @user.anglais == nil
        @user.anglais = 0
        @ang = 0
      else
        @ang =@user.anglais*2
      end

      if  @user.math == nil
         @user.math = 0
        @math = 0
      else
        @math = @user.math*3
      end

      if  @user.pct == nil
         @user.pct = 0
        @pct = 0
      else
        @pct = @user.pct*2
      end

      if  @user.svt == nil
         @user.svt = 0
        @svt = 0
      else
        @svt = @user.svt*2
      end

      if  @user.hisgeo == nil
         @user.hisgeo = 0
        @hist = 0
      else
        @hist = @user.hisgeo*2
        puts @hist
      end


      if @lect==0 && @com ==0 && @ang ==0 && @math ==0 && @pct ==0 && @svt ==0 && @hist ==0
        @total = 0
      else
        @total = @lect + @com + @ang + @math + @pct + @svt + @hist

      end






    elsif @user.moderne == "moderne long all"

      if @user.lecture == nil
        @user.lecture = 0
        @lect = 0
      else
        @lect = @user.lecture*2
      end

      if @user.commecri == nil
        @user.commecri = 0
        @com = 0
      else
        @com =@user.commecri*2
      end

      if @user.anglais == nil
        @user.anglais = 0
        @ang = 0
      else
        @ang =@user.anglais*3
      end

      if  @user.math == nil
         @user.math = 0
        @math = 0
      else
        @math = @user.math*2
      end

      if  @user.allemand == nil
         @user.allemand = 0
        @all = 0
      else
        @all = @user.allemand*2
      end

      if  @user.svt == nil
         @user.svt = 0
        @svt = 0
      else
        @svt = @user.svt*2
      end

      if  @user.hisgeo == nil
         @user.hisgeo = 0
        @hist = 0
      else
        @hist = @user.hisgeo*2
      end

      if @lect==0 && @com ==0 && @ang ==0 && @math ==0 && @all ==0 && @svt ==0 && @hist ==0
        @total = 0
      else
        @total =  @lect + @com + @ang + @math + @all + @svt + @hist

      end

















    elsif @user.moderne == "moderne long esp."
      puts "3"

      if @user.lecture == nil
        @user.lecture = 0
        @lect = 0
      else
        @lect = @user.lecture*2
      end

      if @user.commecri == nil
        @user.commecri = 0
        @com = 0
      else
        @com =@user.commecri*2
      end

      if @user.anglais == nil
        @user.anglais = 0
        @ang = 0
      else
        @ang =@user.anglais*3
      end

      if  @user.math == nil
         @user.math = 0
        @math = 0
      else
        @math = @user.math*2
      end

      if  @user.esp == nil
         @user.esp = 0
        @esp = 0
      else
        @esp = @user.esp*2
      end

      if  @user.svt == nil
         @user.svt = 0
        @svt = 0
      else
        @svt = @user.svt*2
      end

      if  @user.hisgeo == nil
         @user.hisgeo = 0
        @hist = 0
      else
        @hist = @user.hisgeo*2
      end

      if @lect==0 && @com ==0 && @ang ==0 && @math ==0 && @pct ==0 && @svt ==0 && @hist ==0
        @total = 0
      else
        @total =  @lect + @com + @ang + @math + @esp + @svt + @hist
      end

















    end

























    if  @user.commecri == nil && @user.lecture == nil
      @user.commecri = 0
      @user.lecture == 0
    else
      @somfr = @user.commecri + @user.lecture
    end

    @moyenne = "%.2f" % (Float(@total)/15)
    @moyenne = @moyenne.to_f
    @user.moyenne = @moyenne.to_f
    @succes = "ACCEPTE"
    @echec = "REFUSE"

    @d = DateTime.now
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:nom, :prenom, :lecture, :commecri, :anglais, :math, :pct, :svt, :hisgeo, :matricule, :moderne, :esp, :allemand, :moyenne)
    end
end
