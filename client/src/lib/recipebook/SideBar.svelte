<script>
    // TODO: get request
    let promise = [
                    {id: 1, title:"fried rice", user_id: 1},
                    {id: 2, title:"fried Cabbage", user_id: 1},
                    {id: 3, title:"Cake", user_id: 2},
                ]
    export let currentRecipeId;
    export let setCurrentRecipeId;
</script>


sideBar
{#await promise}
    <p>...waiting</p>
{:then recipes}
    loaded
    {#each recipes as recipe (recipe.id)}
        <!-- click recipe button to change info on currentRecipe -->
        <p on:click={setCurrentRecipeId(recipe.id)}>{recipe.title}</p>
    {/each}
{/await}

{currentRecipeId}