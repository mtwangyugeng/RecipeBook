<script>
    import PostProcedure from "../../forms/PostProcedure.svelte";
    import {procedures, getAllProcedures} from "../../stores/Procedure.js"

    export let currentRecipeId;

    getAllProcedures();

    let proceduresDisplayed = [];
    const handleCurrentRecipeIdChange = (currentRecipeId, procedures) => {
        const finale = procedures.filter(v=>v.recipe_id == currentRecipeId);
        proceduresDisplayed = finale
    }

    $: handleCurrentRecipeIdChange(currentRecipeId, $procedures)

    // TODO: Get request
    let amounts = [
        {id: 1, amount: 1, ingredient_id: 1},
        {id: 2, amount: 2, ingredient_id: 2},
        {id: 3, amount: 33, ingredient_id: 3},
    ]

    // TODO: Load all ingredients at once to the parents
    let ingredients = [
        {name: "egg", unit: "piece"},
        {name: "cabbage", unit: "piece"},
        {name: "milk", unit: "ml"},
        {name: "water", unit: "ml"}
    ]



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
            {#each proceduresDisplayed as {id, content} (id)}    
                <li>
                    {content}
                </li>
            {/each}
            <button class="addProcedure" on:click={()=>{addingProcedure = true}}>add procedure</button>
        </ul>
    {/if}
</section>

{#if addingProcedure}
    <PostProcedure close={()=>{addingProcedure=false}} recipe_id={currentRecipeId} />
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

    .addProcedure {
        background-color: blue;
        padding: 10px;
    }
    .addProcedure:hover {
        background-color: rgb(51, 255, 0);
    }

</style>