<script>
    import {ingredients, ingredientsCrud} from '../../stores/Ingredient.js'
    ingredientsCrud.getAll()

    import FormAddingIngredient from './FormAddingIngredient.svelte'
    let addingIngredient = false;
</script>


<section>
    {JSON.stringify($ingredients)}

    <button on:click={()=>{addingIngredient=true}}>Add Ingredient</button>   
</section>

{#if addingIngredient}
    <FormAddingIngredient 
        close={()=>{addingIngredient=false}} 
        submit={ingredientsCrud.post} 
        impJson={{
            name: "",
            unit: "",
            best_market: "",
            common_quantity: "",
            common_price: "",
        }}
    />
{/if}
