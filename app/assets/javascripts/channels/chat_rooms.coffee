jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

  messages_to_bottom()

  if $('#messages').length > 0

    App.global_chat = App.cable.subscriptions.create {
      channel: "ChatRoomsChannel"
      chat_room_id: messages.data('chat-room-id')
    },
    connected: ->
    # Called when the subscription is ready for use on the server

    disconnected: ->
    # Called when the subscription has been terminated by the server

    received: (data) ->
      messages.append data['message']
      messages_to_bottom()

    send_message: (message, chat_room_id, user_name, dialect) ->
      @perform 'send_message', message: message, chat_room_id: chat_room_id, user_name: user_name, dialect: dialect

    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_message textarea.val(), messages.data('chat-room-id'),
          $this.find('#message_user_name').val(), $this.find('#message_dialect').val()

        textarea.val('')
      e.preventDefault()
      return false