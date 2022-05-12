
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:msocial/my_code.dart' show checkIsAndroid;



class Server extends ChangeNotifier{

  static const String host = 'http://192.168.1.100';
  static const int port = 3000;
  static const String uri = '$host:$port';

  // Events
  static const String messageAccepted = "messageAccepted";
  static const String messageReceived= "receive_message";
  static const String messageSend = "message_from_sender";
  static const String isUserConnected = "is_user_connected";
  static const String isUserOnline = "is_user_online";
  static const String sentUsersStatus = "users_status";
  static const String receiveUsersStatus = "receive_Users_Status";
  static const String subEventMessageFromServer = 'message_from_server';

  // Message status
  static const int statusNotSent = 10001;
  static const int statusSent = 10002;
  static const int statusDelivered = 10003;
  static const int statusRead = 10004;

  //Type of chat
  static const String singlChat = "single_chat";
  static const String groupChat = "group_chat";

  // ignore: prefer_typing_uninitialized_variables
  var socket;

  initSocket(context) async{
    // ignore: avoid_print
    print("Connecting to Socket...");
    // socket = IO.io('ws://localhost:8765/ws/',
    //    OptionBuilder().setTransports(['websocket'])
    //        .setExtraHeaders({
    //
    //    }).setQuery({
    //      'idPerdoruesit': UserSingleton.uniqueId,
    //      'usernamePerdoruesit': UserSingleton.emriDheMbiemri,
    //    })
    //        .build());
    //
    //  socket.emit(messageSend, "testtt");
    //  checkConnection();
    //   // connect to the socket server
    socket = await Socket.connect(checkIsAndroid(context) ? '192.168.1.100':'192.168.1.100', 4513,).then((value) {

      value.listen(

        // handle data from the server
            (Uint8List data) {
          // final serverResponse = String.fromCharCodes(data);
        },

        // handle errors
        onError: (error) {
          socket.destroy();
        },

        // handle server ending connection
        onDone: () {
          socket.destroy();
        },
      );
      value.write("From phone");
    });


    // listen for responses from the server



    // send some messages to the server


  }


  checkConnection(){
    if(socket == null){
      return;
    }
    else {
      socket.onConnect((data) {
      });
    }
  }
  checkOnlineUsers(String users) {
    List<String> user = [];
    user.add(users);
    socket.emit("check_online", user);
  }

  listenUsersStatus(Function usersStatus){
    socket.on(receiveUsersStatus,(_){

    });
  }

  listenUserStatus(Function userStatus) {

    socket.on(isUserConnected,(data){
      return data;
    });
  }

  monitoroLidhjen(Function onConnect) {
    return socket.onConnect((data) {
      return onConnect(data);
    });
  }

  lajmeroDaljen(Function function){
    return socket.onDisconnect((data) {
      function(data);
    });
  }

  // closeConnection(){
  //   StartConnection.closeSocket();
  //   return socket.disconnect();
  // }

  setConnectListener(Function onConnect){
    return onConnect(socket.onConnect);
  }

  setOnConnectionErrorListener(Function onConnectError) {
    return onConnectError(socket.onConnectError);
  }

  setOnConnectionErrorTimeOutListener(Function onConnectTimeout) {
    return onConnectTimeout(socket.onConnectTimeout);
  }

  setOnErrorListener(Function onError) {
    return socket.onError((data) {
      onError(onError);
    });
  }

  setOnDisconnectListener(Function onDisconnect) {
    return socket.onDisconnect;
  }

  onMessagSent(dynamic message)async{
    // socket.emit(messageSend, );
    // await sendMessage(socket, message.toJson());
  }

  onMessageReceived(Function onMessage){
    return socket.on(messageReceived,(data){
      return onMessage(data);
    });
  }
  onMessageReceivedFromServer(Function onMessageReceivedFromServer){
    return socket.on(subEventMessageFromServer,(data){
      return onMessageReceivedFromServer(data);
    });
  }

}
