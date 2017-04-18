var searchBar = React.createClass({
  getInitialState: function() {
    return {
        users: [],
        style: "hide"
          };
  }, // getInitialState
  handlechange() {
  var term = this.refs.term.value;
  console.log(term);
  if (term == ' ' || term == '' ) {
          this.setState({
              style: "hide"
            });
        return};
   $.ajax({
       url: `/users/search.json?term=${term}`,
       type: 'GET',
       success: function(data) {
            this.setState({
              users: data,
              style: "show"
            });
              }.bind(this),
      });
  }, // handlechange
  renderResults(){
     return this.state.users.map(function(user, i) {
              return (
                  <a key={i} href={user.profile_url} className="search-link">
                      <li className="user-search-li"><img src={user.img} className="img-circle img-search"/>{user.username}</li>
                  </a>
              );
          }, this  
          );
   },
  render (){       
    return(
      <div>
        <div className="form-group">
         <input type="text" className="form-control" placeholder="Search" onChange={this.handlechange} ref="term" />
        </div>
        <div className="dropdown">
          <ul className={` dropdown-menu search-dropdown-menu ${this.state.style}`} aria-labelledby="dropdownMenu1" aria-expanded="false">
           {this.renderResults()}
          </ul>
        </div>
      </div>
    )
  }
});