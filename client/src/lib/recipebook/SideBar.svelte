<script>
    import PopoutMessage from "./PopoutMessage.svelte"
    import RecipeForm from "./forms/RecipeForm.svelte"
    // TODO: get request
    let recipes = [
                    {id: 1, title:"Fried Rice", user_id: 1},
                    {id: 2, title:"Fried Cabbage", user_id: 1},
                    {id: 3, title:"Cake", user_id: 2},
                ]
    export let setCurrentRecipeId;
    let addingMoreRecipe = false;
    const closeWindow = () => {
        addingMoreRecipe = false;
    }
</script>

<ul>
    <h2>Recipes</h2>
    {#each recipes as recipe (recipe.id)}
        <!-- click recipe button to change info on currentRecipe -->
        <li on:click={setCurrentRecipeId(recipe.id)}>{recipe.title}</li>
    {/each}
    <button on:click={() => addingMoreRecipe = true}>+</button>
</ul>

{#if addingMoreRecipe}
    <PopoutMessage closeWindow={closeWindow} title="Add more recipe">
        <RecipeForm />
    </PopoutMessage>
{/if}


<style> 
    ul {
        width: 200px;
        padding: 10px 5px;
        background-color: yellow;

        display: flex;
        flex-direction: column;
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