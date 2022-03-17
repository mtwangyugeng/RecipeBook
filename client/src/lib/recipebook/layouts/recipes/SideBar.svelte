<script>
    //Terminal
    import {recipes, getAllRecipes, deleteRecipe} from "../../stores/Recipe.js";
    import {token} from "../../stores/User.js";
    import PostRecipe from '../../forms/PostRecipe.svelte';


    getAllRecipes()
    export let setCurrentRecipeId;

    let postingRecipe = false;
</script>

<ul>
    <h2>Recipes</h2>
    {#each $recipes as recipe (recipe.id)}
        <li>
            <div on:click={setCurrentRecipeId(recipe.id)}>{recipe.title}</div>
            <div>update</div>
            <div on:click={()=>{deleteRecipe(recipe.id, $token)}}>delete</div>
        </li>
    {/each}
    <button on:click={() => postingRecipe = true}>+</button>
</ul>

{#if postingRecipe}
    <PostRecipe close={() => {postingRecipe = false}} />
{/if}


<style> 
    ul {
        width: 200px;
        padding: 10px 5px;
        background-color: yellow;

        display: flex;
        flex-direction: column;
        overflow: auto;
    }

    h2 {
        text-align: center;
        
    }

    li {
        cursor: pointer;
        padding: 10px;
    }

    li:hover {
        background-color: red;
    }

    button {
        background-color: orange;
    }
    button:hover {
        background-color: red;
    }
</style>