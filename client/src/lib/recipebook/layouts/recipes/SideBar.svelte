<script>
    //Terminal
    import {recipes, getAllRecipes} from "../../stores/Recipe.js";

    import PostRecipe from '../../forms/PostRecipe.svelte';
    import UpdateRecipe from '../../forms/UpdateRecipe.svelte';
    import DeleteRecipe from '../../forms/DeleteRecipe.svelte';


    getAllRecipes()
    export let setCurrentRecipeId;

    let postingRecipe = false;

    let updatingRecipe = false;
    let updatingRecipeId = null;

    let deletingRecipe = false;
    let deletingRecipeId = null;
</script>

<ul>
    <h2>Recipes</h2>
    {#each $recipes as recipe (recipe.id)}
        <li>
            <div on:click={()=>setCurrentRecipeId(recipe.id, recipe.title)}>{recipe.title}</div>
            <div on:click={()=>{updatingRecipe = true; updatingRecipeId=recipe.id}}>update</div>
            <div on:click={()=>{deletingRecipe = true; deletingRecipeId=recipe.id}}>delete</div>
        </li>
    {/each}
    <button on:click={() => postingRecipe = true}>+</button>
</ul>

{#if postingRecipe}
    <PostRecipe close={() => {postingRecipe = false}} />
{/if}

{#if updatingRecipe}
    <UpdateRecipe close={() => {updatingRecipe = false}} updatingRecipeId={updatingRecipeId}/>
{/if}

{#if deletingRecipe}
    <DeleteRecipe close={() => {deletingRecipe = false}} deletingRecipeId={deletingRecipeId}/>
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