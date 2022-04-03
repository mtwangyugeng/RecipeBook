<script>
    import PostProcedure from "../../forms/PostProcedure.svelte";
    import PostAmount from "../../forms/PostAmount.svelte";
    import {procedures, getAllProcedures} from "../../stores/Procedure.js"
    import {amounts, getAllAmounts} from "../../stores/Amount.js"
    import Ingredient from "./Ingredient.svelte";
import Step from "./Step.svelte";

    export let currentRecipeId;
    export let currentTitle;

    // getAllProcedures();
    // getAllAmounts();

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
        <h2>{currentTitle}</h2>
        <h3>#{currentRecipeId}</h3>

        <h3>Ingredients</h3>
        <ul class="ingredients">
            {#each amountsDisplayed as {id, amount, ingredient_id} (id)}
                <Ingredient id={id} ingredientId={ingredient_id} amount={amount} />
            {/each}
            <button class="addAmount" on:click={()=>{addingAmount = true}}>
                <div>
                    +
                </div>
            </button>
        </ul>

        <h3>Steps</h3>
        <ul class="steps">
            {#each proceduresDisplayed as {id, content} (id)}    
                <Step id={id} content={content}/>
            {/each}
            <li class="addProcedure" on:click={()=>{addingProcedure = true}}>+</li>
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
    .steps > :global(*){
        margin-top: 20px;
        padding: 20px;
        border-radius: 15px;
    }
    section {
        width: calc(100% - 200px);
        background-color: pink;
        padding: 20px
    }

    .ingredients {
        display: flex;
        flex-wrap: wrap;
    }
    .ingredients > :global(*) {
        padding-left: 20px;
        cursor: pointer;
        padding: 10px;
        margin: 2px;
        border-radius: 10px;
        width: 200px;

        display: flex;
        justify-content: space-between;
    }

    .addAmount {
        display: flex;
        justify-content: center;
        background-color: orange;
    }
    .addAmount:hover {
        filter: brightness(80%);
    }
    .addAmount div {
        border: 3px dashed rgb(134, 134, 134);
        width: 100%;
        height: 100%;
        border-radius: 10px;

        display: flex;
        align-items: center;
        justify-content: center;
    }

    .addProcedure {
        border: 3px dashed rgb(134, 134, 134);
        display: flex;
        justify-content: center;
        cursor: pointer;
    }
    .addProcedure:hover {
        background-color: rgb(51, 255, 0);
    }

</style>