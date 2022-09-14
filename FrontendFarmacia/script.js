function goToPost(){
    window.location.href = "createUser.html";
}
window.addEventListener('load', (event) => {

    const baseUrl = 'http://localhost:5500/api';
    
    function login(event) {
        debugger;
        console.log(event.currentTarget);
        event.preventDefault();
        const url = `${baseUrl}/auth/Login`;

        if(!Boolean(event.currentTarget["user-name"].value)){
            var usernameErrorElement = document.getElementById("login-errors");
            usernameErrorElement.textContent= "username is requered"
            usernameErrorElement.style.display = "block"
            return;
        }    


        var data = {
            Email: event.currentTarget["user-name"].value,
            Password: event.currentTarget.password.value
        }

        fetch(url, {
            headers: { "Content-Type": "application/json; charset=utf-8" },
            method: 'POST',
            body: JSON.stringify(data)
        }).then((response) => {
            if (response.status === 200) {
                
                response.json().then((data)=>{
                    debugger;
                    sessionStorage.setItem("jwt", data.token);
                    window.location.href = "laboratories.html";
                    
                });
            } else {
                response.text().then((data) => {
                    debugger;
                    console.log(data);
                });
            }
        }).catch((response) => {

            debugger;
            console.log(data);
        });

    }

    document.getElementById("login-frm").addEventListener("submit", login);
    document.getElementById("createUser").addEventListener('click', goToPost);
});