<script>
    import {ingredients} from '../../stores/Ingredient.js'
    // ingredient + amount

    export let ingredientId;
    export let amount;

    let ingredient = {};
    const getIngredient = (ingredientId) => {
        ingredient = $ingredients.find((v)=>(v.id == ingredientId))
    }
    getIngredient(ingredientId);   
</script>

<li>
    <label>
        <input type="checkbox">
        {ingredient.name}
        {amount}
        {ingredient.unit}
    </label>
</li>


<style>
    li {
        padding-left: 20px;
    }

    label {
        cursor: pointer;
    }

</style>