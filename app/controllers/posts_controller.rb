class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  
  def vote_post
    post_id = params[:post_id];
    agree_value = params[:agree];
    topic_id = params[:topic_id];
    user_id = current_user.id;
    if (post_id)
      UserPostVote.user_vote(user_id,post_id,agree_value)
      # back to topic page
      redirect_to topic_path(:id => topic_id), :notice => 'Voted Successfully';      
      
      
    end
  end
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @topic = Topic.find(@post.topic_id)
  end

  # POST /posts
  # POST /posts.json
  def create
    params[:post][:user_id] = current_user.id
    @post = Post.new(params[:post])

    if @post.save
      redirect_to topic_path(:id => @post.topic_id )
    else
      render action: "new"
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(params[:post])
      topic = Topic.find(@post.topic_id);
      redirect_to topic
      
    else
      render action: "edit"
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    topic = Topic.find(@post.topic_id)
    @post.destroy
    redirect_to topic
  end
end
