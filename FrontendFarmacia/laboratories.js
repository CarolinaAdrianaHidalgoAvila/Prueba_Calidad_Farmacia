function goToForm(){
    window.location.href = "formLaboratory.html";
}
function goToPut(laboratoryId){
    window.location.href = `EditLaboratory.html?laboratoryId=${laboratoryId}`;
}
function goToProducts(laboratoryId){
    window.location.href = `products.html?laboratoryId=${laboratoryId}`;
}
function goToFormProduct(laboratoryId){
    window.location.href = `formProduct.html?laboratoryId=${laboratoryId}`;
}

window.addEventListener('load', (event) => {

    if(!Boolean(sessionStorage.getItem("jwt"))){
        window.location.href = "index.html";
    }
    const baseRawUrl = 'http://localhost:5500';
    const baseUrl = `${baseRawUrl}/api`;
    
    function fetGetLaboratories(){
        debugger;
        let url = `${baseUrl}/laboratories`;
        fetch(url, {
            headers: { 
                       "Authorization": `Bearer ${sessionStorage.getItem("jwt")}`
                    },
            method: 'GET'
        }).then((response) =>{  
            if(response.status === 200){
               response.json().then((data) => {
                    var laboratoriesLiMapped = data.map(p => {
                        const imageUrl = p.imagePath? `${baseRawUrl}/${p.imagePath}` : "";
                       
                      return  `<div  class ="card" data-id = ${p.id}> 
                            <div>
                                <img src="${imageUrl}" alt="Avatar" class="roundImage">
                            </div>
                            <div class="descripcion">
                                <p> Nombre: ${p.name}</p>
                                <p> Direccion: ${p.address}</p> 
                                <p> Telefono:${p.phone}</p>
                                <p> Email: ${p.email}</p> 
                                <p> ¿Hacer Ordenes?:${p.makeOrders}</p>
                            </div>
                            <button class= "borrar" data-delete-laboratory-id="${p.id}">Borrar</button>
                            <button class="editar" type="button" onclick="goToPut(${p.id})">Editar</button><br><br> 
                            <button class="productos" type="button" onclick="goToProducts(${p.id})">Ver Productos</button> 
                            <button class="productos" type="button" onclick="goToFormProduct(${p.id})">Agregar Producto</button>
                        </div>`});
                    var laboratoriesContent = laboratoriesLiMapped.join('');
                    document.getElementById('laboratories-list-content').innerHTML = laboratoriesContent;
                    let buttons = document.querySelectorAll('#laboratories-list-content div button[data-delete-laboratory-id]');
                    for (const button of buttons) {
                        button.addEventListener('click', fetchDeleteLaboratory);
                    }
                });
            } else { 
                response.text().then((error)=>{alert(error)});
            }
        });
    }
     async function fetchDeleteLaboratory(event)
    {
        debugger;
        let id = this.dataset.deleteLaboratoryId;
        let response = await fetch(`${baseUrl}/laboratories/${id}`, 
        {  headers: { 
            "Authorization": `Bearer ${sessionStorage.getItem("jwt")}`
         },
            method: 'DELETE'});
        if(response.status === 200){
            alert("laboratory delete successfuly");
            fetGetLaboratories();
        } else { 
            var error = await response.text();
            alert(error)
        }
    }
    
    fetGetLaboratories();
    document.getElementById('fetch-btn-crear').addEventListener('click',goToForm);
});