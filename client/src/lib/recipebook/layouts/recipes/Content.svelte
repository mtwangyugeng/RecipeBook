<script>
    // TODO: Get request
    let amounts = [
        {id: 1, amount: 1, ingredient_id: 1},
        {id: 2, amount: 2, ingredient_id: 2},
        {id: 3, amount: 33, ingredient_id: 3},
    ]
    let procedures = [
        {id: 1, content: "first step"},
        {id: 2, content: "second step"},
        {id: 3, content: "third step"}
    ]

    // TODO: Load all ingredients at once to the parents
    let ingredients = [
        {name: "egg", unit: "piece"},
        {name: "cabbage", unit: "piece"},
        {name: "milk", unit: "ml"},
        {name: "water", unit: "ml"}
    ]

    export let currentRecipeId;

    let addingProcedure = false;
</script>

<section>
    {#if currentRecipeId}
        <h2>{currentRecipeId}</h2>

        <h3>Ingredients</h3>
        <ul class="ingredients">
            {#each amounts as {id, amount, ingredient_id} (id)}
                <li><label>
                    <input type="checkbox">
                    {ingredients[ingredient_id].name + ": " + amount + " " + ingredients[ingredient_id].unit}
                </label></li>
            {/each}
        </ul>

        <h3>Steps</h3>
        <ul class="steps">
            {#each procedures as {id, content} (id)}    
                <li>
                    {content}
                </li>
            {/each}
            <button on:click={()=>{addingProcedure = true}}>add procedure</button>
        </ul>
    {/if}
</section>

{#if addingProcedure}

{/if}


<style>
    section {
        width: calc(100% - 200px);
        background-color: pink;
        padding: 20px
    }

    .ingredients > li {
        padding-left: 20px;
    }

    .ingredients label {
        cursor: pointer;
    }

    .steps > li {
        margin-top: 20px;
        background-color: rgb(0, 255, 115);
        padding: 20px;
        border-radius: 15px;
    }
</style>