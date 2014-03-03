class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.json
  def total_count(vote,post_id)
   return UserPostVote.total_count(vote,post_id)
  end
  helper_method :total_count  
  def index
    @topics = Topic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find(params[:id])
    @forum = Forum.find(@topic.forum_id)
    @posts = Post.where(:topic_id => @topic.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @forum_id = params[:forum_id];
    @forum = Forum.find(@forum_id) if (params[:forum_id])
    @topic = Topic.new
    @user_id = current_user.id;
 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
    @forum_id = @topic.forum_id;
    @user_id = current_user.id;
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      forum = Forum.find(@topic.forum_id)
      redirect_to forum;
    else
      render action: "new" 
    end

  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    if @topic.update_attributes(params[:topic])
      forum = Forum.find(@topic.forum_id);
      redirect_to forum
    else
      render action: "edit" 
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    forum = Forum.find(@topic.forum_id);
    @topic.destroy
    redirect_to forum 
  end
end
