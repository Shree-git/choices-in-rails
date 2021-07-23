import React, { useEffect, useRef, useState } from "react"
import axios from "axios"

const csrfToken = document.querySelector('[name="csrf-token"]').content;
axios.defaults.headers.common["X-CSRF-TOKEN"] = csrfToken;

const ChatPage = (props) => {  
    const [message, setMessage] = useState("")
    const [chat, setChat] = useState(props.sorted_chats)
    const messagesEndRef = useRef(null)

    const handleChange = (event) => {
      setMessage(event.target.value);
    }

    const handleSubmit = (event) => {
      event.preventDefault()
      axios.post(`${window.location.hostname}/inbox/${props.other_user.id}`, {message: message})
      .then(resp => {
          setMessage("")
          setChat(resp.data)
      })
      .catch(resp => {
        debugger
      })
    }

    const scrollToBottom = () => {
      messagesEndRef.current?.scrollIntoView({ behavior: "smooth" })
    }

    useEffect(()=>{
      scrollToBottom()
    }, [chat])
  

    return (
      <div>
      <div className="header">
        <h1>{props.other_user.email}</h1>
      </div>

    <div className="chat-body overflow-auto">
     {chat.map(chat => (
      <div className={`message-box ${(chat["sender_id"] == props.current_user.id) ? "my-message" : ""}`} key={chat["id"]}>
            <div className={`${(chat["sender_id"] == props.current_user.id) ? "my-timestamp" : "other-timestamp"}`}>{chat["message"]}</div>
            <br />
            <div className={`${(chat["sender_id"] == props.current_user.id) ? "my-timestamp" : "other-timestamp"}`}>{chat["created_at"]}</div>
            <br />
            <div style={{backgroundColor: ""}} className={`${(chat["sender_id"] == props.current_user.id) ? "my-timestamp" : "other-timestamp"}`}>{(chat["sender_id"] == props.current_user.id) ? props.current_user.email : props.other_user.email}</div>
            <br />
            <div ref={messagesEndRef}></div>
        </div>
        
     ))}
        
    </div>
    <form onSubmit={handleSubmit}>
        <label>
          Message:
          <input type="text-area" value={message} onChange={handleChange} />
        </label>
        { message.trim() == "" && <input type="submit" value="Send" disabled />}
        { message.trim() != "" && <input type="submit" value="Send" />}
      </form>
      </div>
      
    )
  }


export default ChatPage;
