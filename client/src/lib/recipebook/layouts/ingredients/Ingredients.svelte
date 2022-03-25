<script>
    import IngredientCard from './IngredientCard.svelte'
    import AddIngredient from './AddIngredient.svelte'
    import {ingredients, getAllIngredients} from '../../stores/Ingredient.js'
    import CardContainer from './CardContainer.svelte'
import RequestingScreen from '../../commons/RequestingScreen.svelte';
import SearchIngredient from './SearchIngredient.svelte';

    let promise = getAllIngredients();

    let search = "";
    $: searchRegex = new RegExp(`(^|\\s)${search}.*`, 'i');
</script>

<section>
{#await promise}
    <RequestingScreen message="Requesting..." />
{:then}
    <SearchIngredient bind:search={search}/>
    <CardContainer>
        {#each $ingredients as ingredient (ingredient.id)}
            <IngredientCard {...ingredient} searchRegex={searchRegex} />
        {/each}
        <AddIngredient /> 
    </CardContainer>
{/await}
</section>


<style>
    section {
        position: relative;
        background-color: lightgreen;
        height: 100%;
        width: 100%;

        display: flex;
        flex-direction: column;
    }


</style>