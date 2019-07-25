/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

var app = {
    // Application Constructor
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
    },
    


    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
       // var listeningElement = parentElement.querySelector('.listening');
      //  var receivedElement = parentElement.querySelector('.received');

      //  listeningElement.setAttribute('style', 'display:none;');
      //  receivedElement.setAttribute('style', 'display:block;');

        console.log('Received Event: ' + id);
    },









    // deviceready Event Handler
    //
    // Bind any cordova events here. Common events are:
    // 'pause', 'resume', etc.
    onDeviceReady: function() {
        console.log('디바이스준비!');
        this.receivedEvent('deviceready');
        FCMPlugin.onNotification(
            function (data) {
                console.log(data);
                if (data.wasTapped) {//알림을 클릭해서 접속하면 이거 보여준다. 
                    alert(data.title + '\n' + data.message);
                    console.log("앱 비활성화 상태에서 알림 탭으로 접속하여 메시지 출력 : ", data);
                } else {//걍 접속중이라면 이거보여준다.
                    if(data.timer=='true'){
                        console.log('타이머정보입니다.')
                        alert(data.title + '\n' + data.message);
                    } else if(data.timer == 'accept') {
                        alert(data.title + '\n' + data.message);
                    }
                    // this will be the state when app is already opened.
                    console.log("앱 활성화중 알림 수신후 출력 : ", data);
                }
            },
            function (msg) {
                console.log('onNotification callback successfully registered: ' + msg);
            },
            function (err) {
                console.log('Error registering onNotification callback: ' + err);
            }
        );
    }
/*
FCMPlugin.onNotification(function(data) {
            if (data.wasUpdated) {
                //alert(data);
            } else {
                //alert(JSON.stringify(data));
                alert(data.body);
            }
        }, function(msg) {
            console.log("onNotification callback successfully registered: " + msg);
        }, function(err) {
            console.log("Error registering onNotification callback :  " + err);
        });
        FCMPlugin.subscribeToTopic('all');

* */
    // Update DOM on a Received Event
    
};

app.initialize();