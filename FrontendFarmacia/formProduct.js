window.addEventListener('load', (event) => {
    var queryParams = window.location.search.split('?');
    var laboId= queryParams[1].split('=')[1];
    const baseUrl= 'http://localhost:5500/api/laboratories'
    function fetchPostProduct(event)
    {
        debugger;
        console.log(event.currentTarget);
        event.preventDefault();

        const formData = new FormData();
        formData.append('name', event.currentTarget.name.value);
        formData.append('purchasePrice', parseFloat(event.currentTarget.purchase.value));
        formData.append('salePrice', parseFloat(event.currentTarget.sale.value));
        formData.append('stock',parseInt(event.currentTarget.stock.value));
        formData.append('presentation', event.currentTarget.presentation.value);
        formData.append('therapeuticAction', event.currentTarget.action.value);
        formData.append('Image', event.currentTarget.image.files[0]);
        debugger;
        let url = `${baseUrl}/${laboId}/products`;

        fetch(url, {
            method: 'POST',
            body: formData
        }).then((response) => {
            if (response.status === 201) {
                alert("product created successfuly");
                window.location.href = "laboratories.html";
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
    
    document.getElementById('fetch-frm').addEventListener('submit', fetchPostProduct)
});