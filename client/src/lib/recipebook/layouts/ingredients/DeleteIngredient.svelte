<script>
import DeleteIngredient from "../../forms/DeleteIngredient.svelte";

    export let id;

    let openPopout = false;
</script>


<button on:click={()=>openPopout = true}>
    delete
</button>

{#if openPopout}
    <DeleteIngredient close={()=>openPopout = false} id={id} />
{/if}


<style>
    button {
        color: rgb(245, 0, 0);
    }
</style>