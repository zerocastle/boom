 $(document).ready(
         function() {

            $("form").submit(function(e) {
               return false;
            });
            $('#login-btn').click(function(e) {
               var query = JSON.stringify({
                  nickname : $('#nickname').val(),
                  m_password : $('#m_password').val()
               });
               $.ajax({
                  type : 'POST',
                  url : "/member/login",
                  data : query,
                  dataType : 'json',
                  contentType : "application/json;charset=UTF-8",
                  success : function(data) {
                     if (data.signal == 'success') {
                        alert(data.nickname + "님 환영 합니다.");

                        location.reload(); // opener 새로고침 
                     }
                     if(data.signal == 'fail'){
                        alert("로그인 실패");
                        window.location.reload();
                     }

                  }
               })
            })
            $('#join-btn').click(
                  function() {
                     self.close();
                     window.open('memberRegister', 'register',
                           'width=1920,height=1080');
                  })
         })