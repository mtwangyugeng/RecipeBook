<script>
        import PostIngredient from '../../forms/PostIngredient.svelte';
        let addingIngredient = false;
</script>

<button class="card" on:click={()=>{addingIngredient=true}}>
    <div>
        Add Ingredient
    </div>
</button>

{#if addingIngredient}
    <PostIngredient close={()=>{addingIngredient=false}}/>
{/if}


<style>
    button {
        background-color: #fff;

        padding: 10px;
        text-transform: capitalize;
        
        display: flex;
        align-items: center;
        justify-content: center;
    }
    button:hover {
        background-color: rgb(190, 190, 190);
    }

    div {
        border: 3px dashed rgb(134, 134, 134);
        width: 150px;
        height: 150px;

        display: flex;
        align-items: center;
        justify-content: center;
    }
</style>