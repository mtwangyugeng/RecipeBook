<script>
    import IngredientCard from './IngredientCard.svelte'
    import AddIngredient from './AddIngredient.svelte'
    import {ingredients, getAllIngredients} from '../../stores/Ingredient.js'
    import CardContainer from './CardContainer.svelte'

    getAllIngredients()
</script>


<section>
    <CardContainer>
        {#each $ingredients as ingredient (ingredient.id)}
            <IngredientCard {...ingredient} />
        {/each}
        <AddIngredient /> 
    </CardContainer>
</section>


<style>
    section {
        background-color: lightgreen;
        height: 100%;
    }

</style>