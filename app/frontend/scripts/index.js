window.addEventListener('DOMContentLoaded', function(){
  var errorCount = 0;
  const btnSignup = document.querySelector('#btn-signup');
    btnSignup.addEventListener('click',function(event){
      var accountContent = document.querySelector('#user_account').value;
      console.log(checkVal(accountContent));
      if (accountContent.length >= 4) {
        console.log("長度OK");
      } else{
        // console.log("長度必須大於4個字元!");
        document.querySelector('#account-error').innerHTML = "長度必須大於4個字元!"
      }; 
      if (checkVal(accountContent)== true) {
        console.log("合法字元");
      } else{
        console.log("請輸入英文及數字!");
        document.querySelector('#account-error').innerHTML = "請輸入英文及數字!"
      }; 
      // if (accountContent.length >= 4) {
      //   console.log("valid");
      // } else{
      //   console.log("invalid");
      // }; 
      event.preventDefault();
  })

  
})
// 使用 RegExp 來判斷輸入的值是英文及數字
function checkVal( str ) {
  var regExp = /^[\d|a-zA-Z]+$/;
  return regExp.test(str)
}