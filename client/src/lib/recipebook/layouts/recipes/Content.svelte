<script>
    import PostProcedure from "../../forms/PostProcedure.svelte";
    import PostAmount from "../../forms/PostAmount.svelte";
    import {procedures, getAllProcedures} from "../../stores/Procedure.js"
    import {amounts, getAllAmounts} from "../../stores/Amount.js"

    export let currentRecipeId;

    getAllProcedures();
    getAllAmounts();

    let proceduresDisplayed = [];
    let amountsDisplayed = [];
    const handleCurrentRecipeIdChange = (currentRecipeId, procedures, amounts) => {
        proceduresDisplayed = procedures.filter(v=>v.recipe_id == currentRecipeId);
        amountsDisplayed = amounts.filter(v=>v.recipe_id == currentRecipeId);
    }

    $: handleCurrentRecipeIdChange(currentRecipeId, $procedures, $amounts)

    let addingProcedure = false;
    let addingAmount = false;
</script>

<section>
    {#if currentRecipeId}
        <h2>{currentRecipeId}</h2>

        <h3>Ingredients</h3>
        <ul class="ingredients">
            {#each amountsDisplayed as {id, amount, ingredient_id} (id)}
                <li><label>
                    <input type="checkbox">
                    {id + ", ingredient: " +ingredient_id + " amount: " + amount + " "}
                </label></li>
            {/each}
            <button class="addProcedure" on:click={()=>{addingAmount = true}}>add amount</button>
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

{#if addingAmount}
    <PostAmount close={()=>{addingAmount=false}} recipe_id={currentRecipeId} />
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