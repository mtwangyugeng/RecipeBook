<script>

        export let id;
        export let ingredient_id;
        export let amount;

        import {ingredients} from '../../stores/Ingredient.js'

        let ingredient = {}
        $: {
            if($ingredients.length > 0)
                ingredient = $ingredients.find((v)=>(v.id == ingredient_id))
        }
        

        import {minus} from '../../stores/ShoppingList.js'
        const onClick = function() {
            minus(ingredient_id);
        }
    </script>
    

    <div class="container" on:click={onClick}>
        <h3>{ingredient.name} ({ingredient.common_quantity} {ingredient.unit} ) / ${ingredient.common_price/100}  x {amount}</h3>
        <p>Best Shop: {ingredient.best_market}</p>
        <p>Total Cost: ${amount * ingredient.common_price / 100}</p>
    </div>
    
    
    <style>
        .container {
            background-color: yellow;
            margin: 10px;
            padding: 10px;
            cursor: pointer;
            user-select: none;
        }
    </style>