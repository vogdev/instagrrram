var VoteButton = React.createClass({
  getInitialState: function() {
    return {
        voted: this.props.voted,
        likes: this.props.likes
          };
  }, // getInitialState
  handleLike(post_id) {
   $.ajax({
       url: `/posts/${post_id}/like`,
       type: 'PUT',
       success: function() {
            this.setState({
              voted: !this.state.voted,
               likes: this.state.likes + 1,
            });
              }.bind(this),
      });
  }, // handleLike
  handleUnlike(post_id) {
    $.ajax({
       url: `/posts/${post_id}/unlike`,
       type: 'PUT',
      success: function() {
      this.setState({
        voted: !this.state.voted,
        likes: this.state.likes - 1,
      });
        }.bind(this),
      });
  }, // handleUnlike
renderBtn(){
   if (this.state.voted) {
     return (
         <div className="btn btn-floating"  onClick={()=>this.handleUnlike(this.props.post_id)}>
          <span className="glyphicon glyphicon-heart"></span>
         </div>
     );
   } else {
     return (
       <div className="btn btn-floating"  onClick={()=>this.handleLike(this.props.post_id)}>
           <span className="glyphicon glyphicon-heart-empty"></span>
       </div>
     );
   }
 },
  render (){       
    return(
      <div>
      {
        /* if size of comments is equal to 1 print the number 1  + the string "like" else print number of likes + string "likes" */
        <p className="bt">{(this.state.likes == 1) ? this.state.likes + " like" : this.state.likes + " likes"}</p>
      }
        <span>
          { this.renderBtn() }
        </span>
      </div>
    )
  }
});