import React from "react";
import axios from "axios";

const csrfToken = document.querySelector('[name="csrf-token"]').content;
axios.defaults.headers.common["X-CSRF-TOKEN"] = csrfToken;

class ChatPage extends React.Component {
  constructor() {
    super();

    axios
      .get("http://localhost:3000/inbox/chat/3", {
        headers: {"Access-Control-Allow-Origin": "*"}
      })
      .then((data) => {
        console.log(data)
        debugger
      })
      .catch((data) => {
        debugger
      });
  }

  render() {
    return <div>Chat page works</div>;
  }
}

export default ChatPage;
