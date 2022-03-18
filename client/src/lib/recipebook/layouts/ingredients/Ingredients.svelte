<script>
    import {ingredients, getAllIngredients} from '../../stores/Ingredient.js'
    getAllIngredients()
    
    import IngredientCard from './IngredientCard.svelte'

    import AddIngredient from './AddIngredient.svelte'
</script>


<section>
    <div class="card-container">
        {#each $ingredients as ingredient (ingredient.id)}
            <IngredientCard {...ingredient} />
        {/each}
        <AddIngredient /> 
    </div> 

</section>


<style>
    section {
        background-color: lightgreen;
        height: 100%;
    }

    .card-container {
        /* background-color: blue; */
        display: flex;
        flex-wrap: wrap;
    }

</style>