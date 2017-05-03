var followBtn = React.createClass({
  getInitialState: function() {
    return {
        users: [],
        id: this.props.relation_id,
        following: this.props.following,
          };
  },
 handleFollow() {
            $.post(`/relationships/?followed_id=${this.props.user_id}`, function(response) {
                    this.setState({
                    id: response,
                    following: true
                });
            }.bind(this));
 }, // handleFollow
 handleUnFollow() {
$.ajax({
   url: `/relationships/${this.state.id}/unfollow`,
   type: 'DELETE',
success: function(data) {
        this.setState({ following: false });
      }.bind(this),
});
 }, // handleUnFollow
 renderBtn(){
  if (this.state.following == false){
          return (
              <button className="btn btn-info modal-following" onClick={()=>this.handleFollow()}>follow</button>
          );  
  } else {
          return (
              <button className="btn modal-following" onClick={()=>this.handleUnFollow()}>Unfollow</button>
          );  
    }
 },
  render (){       
    return(
      <div>
          {this.renderBtn()}
      </div>
    )
  }
});