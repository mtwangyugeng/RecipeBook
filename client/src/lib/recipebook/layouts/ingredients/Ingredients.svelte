<script>
    import {ingredients, getAllIngredients} from '../../stores/Ingredient.js'
    getAllIngredients()

    import PostIngredient from '../../forms/PostIngredient.svelte'

    let addingIngredient = false;
</script>


<section>
    {JSON.stringify($ingredients)}

    <button on:click={()=>{addingIngredient=true}}>Add Ingredient</button>   
</section>

{#if addingIngredient}
    <PostIngredient close={()=>{addingIngredient=false}}/>
{/if}
