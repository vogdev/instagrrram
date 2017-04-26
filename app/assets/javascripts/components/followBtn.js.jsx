var followBtn = React.createClass({
  getInitialState: function() {
    return {
        users: [],
        id: this.props.relation_id,
        following: this.props.following,
          };
  }, // getInitialState
  // componentDidMount: function () {
  //           $.get("/users/explore.json", function(response) {
  //                   this.setState({
  //                   users: response
  //               });
  //           }.bind(this));
  //       }, //componentDidMount
 handleFollow() {
            $.post(`/relationships/?followed_id=${this.props.user_id}`, function(response) {
                    this.setState({
                    id: response,
                    following: !this.props.following
                });
                // console.log(response);
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
// renderBtn(){
//    if (this.state.voted) {
//      return (
//          <div className="btn btn-floating"  onClick={()=>this.handleUnlike(this.props.post_id)}>
//           <span className="glyphicon glyphicon-heart"></span>
//          </div>
//      );
//    } else {
//      return (
//        <div className="btn btn-floating"  onClick={()=>this.handleLike(this.props.post_id)}>
//            <span className="glyphicon glyphicon-heart-empty"></span>
//        </div>
//      );
//    }
//  },
  render (){       
    return(
      <div>
{this.renderBtn()}
      </div>
    )
  }
});