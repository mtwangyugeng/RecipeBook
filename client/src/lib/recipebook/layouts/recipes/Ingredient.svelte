<script>
import { deleteAmount } from '../../stores/Amount.js';
import {token} from "../../stores/User.js";

    import {ingredients} from '../../stores/Ingredient.js'
import { add } from '../../stores/ShoppingList.js';
    // ingredient + amount
    
    export let id;
    export let ingredientId;
    export let amount;

    let ingredient = {};
    const getIngredient = (ingredientId) => {
        ingredient = $ingredients.find((v)=>(v.id == ingredientId))
    }
    getIngredient(ingredientId);   

    const handleClick = function () {
        add(ingredientId)
    }

    const handeleDelete = function () {
        deleteAmount(id, $token)
    }


</script>

<li on:click|self={handleClick}>
    {ingredient.name}
    {amount}
    {ingredient.unit}
    <div>+</div>
    <div class="delete" on:click={handeleDelete}>-</div>
</li>


<style>
    li {
        padding-left: 20px;
        cursor: pointer;
        padding: 10px;
        margin: 2px;
        border-radius: 10px;
        background-color: yellow;
        width: 200px;

        display: flex;
        justify-content: space-between;
    }

    li > div {
        color: yellow;
    }
    li:hover > div {
        color: black;
    }
    .delete {
        background-color: red;
        border-radius: 50%;
        width: 20px;
        height: 20px;
        display: flex;
        justify-content: center;
    }

</style>