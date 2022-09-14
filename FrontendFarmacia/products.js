window.addEventListener('load',(event)=>{
    var queryParams = window.location.search.split('?');
    var laboratoryId= queryParams[1].split('=')[1];
    const baseRawUrl = 'http://localhost:5500';
    const baseUrl= 'http://localhost:5500/api/laboratories'
    function fetGetProducts(){
        debugger;
        fetch(`${baseUrl}/${laboratoryId}/products`,{  method: 'GET'})
        .then((response) =>{ 
            if(response.status === 200){
               response.json().then((data) => {
                    var productsLiMapped = data.map(p => {
                        const imageUrl = p.imagePath? `${baseRawUrl}/${p.imagePath}` : "";

                       return `<div class="card-block" data-id = ${p.id}>
                     <div class="card">  
                       <div>
                       <img src="${imageUrl}" alt="Avatar" class="roundImage">
                         </div>
                        <div class="descripcion">
                         <p> Nombre: ${p.name}</p>
                         <p> Precio Compra: ${p.purchasePrice}</p> 
                         <p> Precio Venta:${p.salePrice}</p> 
                         <p> Stock: ${p.stock}</p>
                         <p> Presentacion: ${p.presentation}</p> 
                         <p> Accion Terapeutica:${p.therapeuticAction}</p>
                         </div></div>
                    <button class ="borrar" data-delete-product-id="${p.id}">Borrar</button>
                    <button class ="editar" data-editar-product-id="${p.id}">Editar</button></div>`});
                    var productsContent = productsLiMapped.join('');
                    document.getElementById('products-list-content').innerHTML = productsContent;

                    let buttons = document.querySelectorAll('button[data-delete-product-id]');
                    for( button of buttons){
                        button.addEventListener('click',fetchDeleteProduct);
                    }
                    let buttonsEdit = document.querySelectorAll('button[data-editar-product-id]');
                    for( buttonEdit of buttonsEdit){
                        buttonEdit.addEventListener('click',fetchPutProduct);
                    }
                });
            } else { 
                response.text().then((error)=>{alert(error)});
            }
        });
    }
    async function fetchDeleteProduct(event)
    {
        debugger;
        let id = this.dataset.deleteProductId;
        let response = await fetch(`${baseUrl}/${laboratoryId}/products/${id}`, 
        { method: 'DELETE'});
        if(response.status === 200){
            alert("laboratory delete successfuly");
            fetGetProducts();
        } else { 
            var error = await response.text();
            alert(error)
        }
    }
    function fetchPutProduct(event)
    {
        debugger;
        let id = this.dataset.editarProductId;
        console.log(event.currentTarget);
        event.preventDefault();
        var editForm = document.getElementById('fetch-edit-frm');
        const formData = new FormData();
        formData.append('name', editForm.name.value);
        formData.append('purchasePrice', parseFloat(editForm.purchase.value));
        formData.append('salePrice', parseFloat(editForm.sale.value));
        formData.append('stock',parseInt(editForm.stock.value));
        formData.append('presentation', editForm.presentation.value);
        formData.append('therapeuticActio', editForm.action.value);
        formData.append('Image', editForm.image.files[0]);
        debugger;

        let url = `${baseUrl}/${laboratoryId}/products/${id}`;

        fetch(url, {
            method: 'PUT',
            body: formData
        }).then((response) => {
            if (response.status === 200) {
                alert("producto fue editado");
                fetGetProducts();
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
    fetGetProducts();
});