<script>

        export let id;
        export let ingredient_id;
        export let ingredient_amount;

        import {ingredients} from '../../stores/Ingredient.js'

        let ingredient = $ingredients.find((v)=>(v.id == ingredient_id))

    </script>
    

    <div class="container">
        <h3>{ingredient.name} ({ingredient.common_quantity} {ingredient.unit} ) x {ingredient_amount}</h3>
        <p>Total Cost: ${ingredient_amount * ingredient.common_price / 100}</p>
    </div>
    
    
    <style>
        .container {
            background-color: yellow;
            margin: 10px;
            padding: 10px;
            cursor: pointer;
        }
    </style>