var profileFollow = React.createClass({
getInitialState: function() {
    return {
      Users: []
          };
  }, // getInitialState
   loadFollowers(user_id) {
if (this.props.followers_count == 0) return;
    fetch('http://localhost:3000/user/' + user_id + '/followers.json')
      .then(data => data.json())
      .then(data =>{this.setState({Users: data})
        $('#follow').modal('toggle');
        });
    },
 loadFollowings(user_id) {
if (this.props.following_count == 0) return;
    fetch('http://localhost:3000/user/' + user_id + '/following.json')
      .then(data => data.json())
      .then(data =>{this.setState({Users: data})
        $('#follow').modal('toggle');
        });
  },
renderModal(){
      return this.state.Users.map(function(user, i) {
          return (
          <div className="media" key={i}>
              <a href={user.profile_url}>
            <div className="media-left">
                <img className="media-object media-img img-circle " src={user.img} alt="..." />
            </div>
            <div className="media-body">
              <h4 className="media-heading">{user.username}</h4>
            </div>
              </a>
          </div>
          );
      }, this // <== this is necessary to call getPortfolioData function from inside the map iterator  
      );
 },
  render (){       
    return(
      <div>
        <ul className="list-unstyled status-list">
          <li><span className="lead">{this.props.posts_count}</span> posts</li>
          <li onClick={()=>this.loadFollowers(this.props.user_id)}><span className="lead">{this.props.followers_count}</span> followres</li>
          <li onClick={()=>this.loadFollowings(this.props.user_id)}><span className="lead">{this.props.following_count}</span> following</li>
        </ul>
        <span>
               <div className="modal fade" id="follow" role="dialog" aria-labelledby="myModalLabel">
               <button type="button" className="close modal-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <div className="modal-dialog" role="document">
                  <div className="modal-content users-modal">
                    <div className="modal-header">
                      <button type="button" className="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 className="modal-title" id="myModalLabel">Modal title</h4>
                    </div>
                    <div className="modal-body">
                      <div className="users-container">
                      { this.renderModal() }
                      </div>
                    </div>
                  </div>
                </div>
              </div>
        </span>
      </div>
    )
  }
});