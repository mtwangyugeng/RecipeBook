<script>
    export let id;
    export let name;
    export let unit;
    export let best_market;
    export let common_quantity;
    export let common_price;

    // TODO: 
    // export let created_at;
    // export let updated_at;
    // export let user_id;
</script>


<div class="container">
    <h3>#{id} {name}</h3>
    <div class="img-container"></div>
    <p>Best Shop: {best_market}</p>
    <p>Pakage: {common_quantity} {unit} / ${common_price/100}</p>
</div>


<style>
    .container {
        background-color: white;
        width: 200px;
        height: 260px;
        margin: 10px;
        border-radius: 10px;

        padding: 10px;
        text-transform: capitalize;

        -webkit-box-shadow: 8px 5px 8px -8px #000000; 
        box-shadow: 8px 5px 8px -8px #000000;
    }

    h3 {
        text-align: center;
    }

    .img-container {
        height: 50%;
        border: 1PX solid #000000;
        margin: 10px 0 15px 0;
    }
</style>