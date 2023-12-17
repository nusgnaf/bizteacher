class IntroController < ApplicationController
    @@idx = Student.all.map {|one| one.stuid }
    # before_action :check_valid
    # skip_before_action :check_valid
    def index
      session[:valid?] ||= false
      session[:submitted?] ||= false
      unless session[:valid?]
        flash[:error] = "Please input your student ID"
      end

    end
    def finale
      session[:valid?] ||= false
    end
    # costly operation
    def get_score
      @missing_deadline_users = Student.where(submitted: nil)
      @missing_deadline_users.each do |student|
        student.update(score: rand(64..69))
      end
      @submitted_students = Student.where(submitted: true)
      @submitted_students.each do |student|
        student.update(score: rand(86..96))
      end
    end

    def score
      @students = Student.all
    end
    def missing
      @missing_deadline_users = Student.where(submitted: nil)
    end

    def check2
      stuid = params[:stuid].to_i
      if @@idx.include?(stuid)
        @student = Student.find_by(stuid: stuid)
        session[:valid?] = true
        session[:score] = @student.score
        session[:name] = @student.name
      end
      redirect_to '/intro/finale', notice: "分数已出"
    end
    def check
      stuid = params[:stuid].to_i
      if @@idx.include?(stuid)
        @student = Student.find_by(stuid: stuid)
        session[:valid?] = true
        session[:stuid] = stuid
        session[:submitted?] = @student.submitted
        session[:name] = @student.name
      end
      # redirect_back(fallback_location: '/intro/index')
      redirect_to '/intro/index', notice: "请在6月20日之前上传作业！"
    end

    def upload
      @student = Student.find_by(stuid: session[:stuid])
      if @student.update(params.permit(:homework))
        session[:submitted?] = true
        @student.submitted = true
        @student.save
        redirect_to '/intro/index'
      end
    end

    def backdoor
      reset_session
      redirect_to '/intro/index'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_student
        @student = Student.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def student_params
        params.require(:student).permit(:name, :stuid, :submitted?, :homework)
      end
      def check_valid
      end
  end