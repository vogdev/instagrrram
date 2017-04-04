var FollowButton = React.createClass({
 renderBtn(){
    if (this.props.voted) {
      return (
          <div className="btn btn-floating"  onClick={()=>this.props.handelUnlike(this.props.post_id, this.props.index)}>
         	 <span className="glyphicon glyphicon-heart"></span>
          </div>
      );
    } else {
      return (
        <div className="btn btn-floating"  onClick={()=>this.props.handelLike(this.props.post_id, this.props.index)}>
        		<span className="glyphicon glyphicon-heart-empty"></span>
        </div>
      );
    }
  },

  render (){        
    return(
      <span>
        { this.renderBtn() }
      </span>
    )
  }
});