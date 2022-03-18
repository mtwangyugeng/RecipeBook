<script>
    import {ingredients, getAllIngredients} from '../../stores/Ingredient.js'
    getAllIngredients()

    import PostIngredient from '../../forms/PostIngredient.svelte'

    import IngredientCard from './IngredientCard.svelte'

    let addingIngredient = false;
</script>


<section>
    {JSON.stringify($ingredients)}
    <div class="card-container">
        {#each $ingredients as ingredient (ingredient.id)}
            <IngredientCard {...ingredient} />
        {/each}
    </div> 
    <button on:click={()=>{addingIngredient=true}}>Add Ingredient</button>   
</section>

{#if addingIngredient}
    <PostIngredient close={()=>{addingIngredient=false}}/>
{/if}

<style>
    section {
        background-color: lightgreen;
    }

    .card-container {
        background-color: blue;
        display: flex;
        flex-wrap: wrap;
    }
</style>