window.addEventListener('load', (event) => {
    if(!Boolean(sessionStorage.getItem("jwt"))){
        window.location.href = "index.html";
    }
    function fetchPostLaboratory(event)
    {
        debugger;
        event.preventDefault();
        const baseUrl = 'http://localhost:5500/api';
        let url = `${baseUrl}/laboratories`;
    

        const formData = new FormData();
        formData.append('Name', event.currentTarget.name.value);
        formData.append('Address', event.currentTarget.address.value);
        formData.append('Phone', event.currentTarget.phone.value);
        formData.append('Email',event.currentTarget.email.value);
        formData.append('MakeOrders', parseInt(event.currentTarget.ordenes.value));
        formData.append('Image', event.currentTarget.image.files[0]);
        debugger;

        fetch(url, {
            headers: {"Authorization": `Bearer ${sessionStorage.getItem("jwt")}`},
            method: 'POST',
            body: formData
        }).then(response => {
            if(response.status === 201){
                alert('laboratory was created');
                window.location.href = "laboratories.html";
            } else {
                response.text()
                .then((error)=>{
                    alert(error);
                });
            }
        });
    }
    
    document.getElementById('fetch-frm').addEventListener('submit', fetchPostLaboratory)
});