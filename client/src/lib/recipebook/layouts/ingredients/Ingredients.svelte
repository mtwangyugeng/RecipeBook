<script>
    import IngredientCard from './IngredientCard.svelte'
    import AddIngredient from './AddIngredient.svelte'
    import {ingredients, getAllIngredients} from '../../stores/Ingredient.js'
    import CardContainer from './CardContainer.svelte'
import RequestingScreen from '../../commons/RequestingScreen.svelte';


    let promise = getAllIngredients();

    let search = "";
    $: searchRegex = new RegExp(`(^|\\s)${search}.*`, 'i');

    import { flip } from 'svelte/animate';
import SearchBar from '../../commons/SearchBar.svelte';

</script>


<section>
{#await promise}
    <RequestingScreen message="Requesting..." />
{:then}
    <SearchBar bind:search={search} placeholder="Search By Ingredient Name"/>
    <CardContainer>
        {#each $ingredients.filter(v => searchRegex.test(v.name)) as ingredient (ingredient.id)}
            <div animate:flip="{{duration: 200}}">
                <IngredientCard {...ingredient} />
            </div>
        {/each}
        <AddIngredient /> 
    </CardContainer>
{:catch error}
	<p style="color: red">{error.message}</p>
{/await}
</section>


<style>
    section {
        position: relative;
        background-color: rgb(233, 164, 164);
        height: 100%;
        width: 100%;

        display: flex;
        flex-direction: column;
        align-items: center;
    }


</style>