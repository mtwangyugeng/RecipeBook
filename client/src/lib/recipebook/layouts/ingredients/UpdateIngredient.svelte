<script>
    import UpdateIngredient from "../../forms/UpdateIngredient.svelte";

    export let id;
    export let name;
    export let unit;
    export let best_market;
    export let common_quantity;
    export let common_price;

    let openPopout = false;
</script>


<button on:click={()=>openPopout = true}>
    update
</button>

{#if openPopout}
    <UpdateIngredient close={()=>openPopout = false} id={id} name={name} unit={unit} best_market={best_market} common_quantity={common_quantity} common_price={common_price}/>
{/if}


<style>
    
</style>