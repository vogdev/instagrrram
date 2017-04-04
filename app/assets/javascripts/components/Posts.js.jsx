
var Posts = React.createClass({
	getInitialState: function() {
		return {
			postsUrl: 'http://localhost:3000/posts.json',
			posts:[],
					};
	}, // getInitialState
	 componentDidMount: function() {
      $.ajax({
        method: "GET",
        url: this.state.postsUrl,
        success:() => {
               console.log("Data loaded");
            },
        error:() => {
        			console.log("something went wrong.");
            }
      }).done(function(data){
        this.setState({ posts: data });
      }.bind(this));
    },// componentWillMount
     handelUnlike(post_id, index) {
    	$.ajax({
            url: `/posts/${post_id}/unlike`,
            type: 'PUT',
					success: function(data) {
						var postsarray = this.state.posts;
						postsarray[index].voted = !postsarray[index].voted;
						postsarray[index].post_likes = postsarray[index].post_likes - 1;
						this.setState({posts: postsarray});
            	}.bind(this),
           });
    },
    	handelLike(post_id, index) {
	    	$.ajax({
            url: `/posts/${post_id}/like`,
            type: 'PUT',
            	success: function(data) {
						var postsarray = this.state.posts;
						postsarray[index].voted = !postsarray[index].voted;
						postsarray[index].post_likes = postsarray[index].post_likes + 1;
						this.setState({posts: postsarray});
            	}.bind(this),
           });
	    },
    	renderPosts: function () {
	    return this.state.posts.map(function(post, i) {
	        return (
					<div className="col-sm-12 col-md-12" key={i}>
					  <div className="thumbnail">
					    <div className="thumbnail-header">
					      <div className="user_info">
					         <img src={post.post_owner_image} className="img-circle post-user-img"/>
				          	<a href={post.post_user_profile}>
					         	 <p className="bt">
					          		{post.post_username}
				          		</p>
				          	</a>
					      </div>
					      <div className="post-date">
					        <p>{post.post_time_ago}</p>
					      </div>
					    </div>
					    <div className="post-image">
					    	<img src={post.post_image} className="img-responsive" />
					    </div>

			          <div className="caption">
				        <p className="bt">{post.post_likes}</p>
		                 <div className="post-comments">
        							<dl className="dl-horizontal">
        							<Comments comments={post.comments}/>
        							</dl>
   						  </div>
				      	<FollowButton handelUnlike={this.handelUnlike} handelLike={this.handelLike} voted={post.voted} post_id={post.post_id} index={i}/>
				      </div>
					  </div>
					</div>
	        );
	    }, this
	    );
	}, // renderPosts
	render (){
		return (
					<div>
						{this.renderPosts()}
						<h1 onClick={this.handelUnlike}> Unlike</h1>
						<h1 onClick={this.handelLike}>Like</h1>
					</div>
			); // return
	} // render
  });