import React from "react"
import axios from "axios"

const csrfToken = document.querySelector('[name="csrf-token"]').content;
axios.defaults.headers.common["X-CSRF-TOKEN"] = csrfToken;

class ChatPage extends React.Component {
  constructor(props) {
    super(props);
    console.log(this.props)
    axios
      .get(`http://localhost:3000/inbox/${this.props.id}`, {
        headers: {"Access-Control-Allow-Origin": "*"}
      })
      .then((data) => {
        console.log(data)
        
        
      })
      .catch((data) => {
        
        debugger
      });
  }

  render() {
    return (

      <div>{this.props.id}</div>
      
      
    )
  }
}

export default ChatPage;
