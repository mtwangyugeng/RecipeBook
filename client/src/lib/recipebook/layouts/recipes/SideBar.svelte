<script>
    import PopoutMessage from "../PopoutMessage.svelte"

    import RecipeForm from "../../forms/RecipeForm.svelte"
    import {recipes, recipesCrud} from "../../stores/Recipe.js"

    import {token} from "../../stores/User.js"
    recipesCrud.getAll()

    export let setCurrentRecipeId;
    let addingMoreRecipe = false;
    const closeWindow = () => {
        addingMoreRecipe = false;
    }
</script>

<ul>
    <h2>Recipes</h2>
    {#each $recipes as recipe (recipe.id)}
        <!-- click recipe button to change info on currentRecipe -->
        <li>
            <div on:click={setCurrentRecipeId(recipe.id)}>{recipe.title}</div>
            <div>update</div>
            <div on:click={()=>{recipesCrud.delete(recipe.id, $token)}}>delete</div>
        </li>
    {/each}
    <button on:click={() => addingMoreRecipe = true}>+</button>
</ul>

{#if addingMoreRecipe}
    <PopoutMessage closeWindow={closeWindow} title="Add more recipe">
        <RecipeForm closeWindow={closeWindow} post={recipesCrud.post}/>
    </PopoutMessage>
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