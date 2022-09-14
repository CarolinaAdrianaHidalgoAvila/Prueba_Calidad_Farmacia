window.addEventListener('load', (event) => {
    if(!Boolean(sessionStorage.getItem("jwt"))){
        window.location.href = "index.html";
    }
    //document.getElementById("laboratoryId").textContent= laboratoryId;
    function fetchPutLaboratory(event)
    {
        var queryParams = window.location.search.split('?');
        var laboratoryId= queryParams[1].split('=')[1];
        debugger;
        event.preventDefault();
        const baseUrl = 'http://localhost:5500/api';
        let url = `${baseUrl}/laboratories/${laboratoryId}`;
        var editForm = document.getElementById('fetch-edit-frm');

        const formData = new FormData();
        formData.append('name', editForm.name.value);
        formData.append('address', editForm.address.value);
        formData.append('phone', editForm.phone.value);
        formData.append('email',editForm.email.value);
        formData.append('makeOrders', parseInt(editForm.ordenes.value));
        formData.append('image', editForm.image.files[0]);
        debugger;

        fetch(url, {
            headers: {"Authorization": `Bearer ${sessionStorage.getItem("jwt")}`},
            method: 'PUT',
            body: formData
        }).then(response => {
            if(response.status === 200){
                alert('laboratory was edit');
                window.location.href = "laboratories.html";
            } else {
                response.text()
                .then((error)=>{
                    alert(error);
                });
            }
        });
    }
    
    document.getElementById('fetch-edit-frm').addEventListener('submit', fetchPutLaboratory)
});