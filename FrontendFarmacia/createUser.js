window.addEventListener('load', (event) => {

    const baseUrl = 'http://localhost:5500/api';
    
    function createUser(event) {
        debugger;
        console.log(event.currentTarget);
        event.preventDefault();
        const url = `${baseUrl}/auth/User`;

        if(!Boolean(event.currentTarget["user-name"].value)){
            var usernameErrorElement = document.getElementById("login-errors");
            usernameErrorElement.textContent= "username is requered"
            usernameErrorElement.style.display = "block"
            return;
        }    


        var data = {
            Email: event.currentTarget["user-name"].value,
            Password: event.currentTarget.password.value,
            ConfirmPassword: event.currentTarget.confirmPassword.value
        }

        fetch(url, {
            headers: { "Content-Type": "application/json; charset=utf-8" },
            method: 'POST',
            body: JSON.stringify(data)
        }).then((response) => {
            if (response.status === 200) {
                
                response.json().then((data)=>{
                    debugger;
                    //sessionStorage.setItem("jwt", data.token);
                    window.location.href = "index.html";
                    
                });
            } else {
                response.text().then((data) => {
                    debugger;
                    //console.log(data);
                });
            }
        }).catch((response) => {

            debugger;
            console.log(data);
        });

    }

    document.getElementById("createUser-frm").addEventListener("submit", createUser);

});
