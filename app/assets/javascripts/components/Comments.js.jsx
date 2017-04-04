var Comments = React.createClass({
      renderComments: function () {
      return this.props.comments.map(function(comment, i) {
          return (
            <span key={i}>
              <dt>{comment.comment_username}: </dt>
              <dd> &nbsp;{comment.comment_content} </dd>
            </span>
           ); 
      }
      );
  }, // renderComments
    render (){        
    return(
      <span>
        {this.renderComments()}
      </span>
    )
  }// render
});