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
    <div class="add">+</div>
    <div class="delete" on:click={handeleDelete}>-</div>
</li>


<style>
    li {
        display: flex;
        justify-content: space-between;
        background-color: yellow;
    }

    li > .add {
        color: yellow;
    }
    li:hover > .add {
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
    .delete:hover {
        background-color: pink;
    }

</style>