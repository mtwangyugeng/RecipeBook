<script>
    import {listItems} from "../../stores/ShoppingList.js";

    
import ListItem from "./ListItem.svelte";
import {ingredients} from '../../stores/Ingredient.js';

//get total amount
let total = 0;
$:{ 
    total = 0;
    $listItems.forEach(item => {
        let ingredient = $ingredients.find((v)=>(v.id == item.ingredient_id))
        if(ingredient)
            total += item.amount * ingredient.common_price
    });
}


import {token} from "../../stores/User.js"

// $: {
//     if($token)
//         getAllListItems();
//     else
//         ingredients.set([])
// }
</script>

<section>
    <div class="list-items">
    {#each $listItems as item (item.id)}
        <ListItem {...item} />
    {/each}
    </div>
    <div class="total">
        Total: ${total / 100}
    </div>
</section>

<style>
    section {
        display: flex;
        flex-direction: column;
        background-color: blue;
        width: 300px;
        
    }
    .list-items{
        max-height: 300px;
        overflow: auto;
    }

    .total {
        padding: 10px;
        margin: 10px;
        background-color: orange;
    }
</style>