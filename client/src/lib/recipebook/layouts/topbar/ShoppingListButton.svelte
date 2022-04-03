<script>
import ShoppingLists from "../shoppinglists/ShoppingLists.svelte";
import {listItems} from "../../stores/ShoppingList.js"

let activated = false;
const handleClick = function () {
    activated = !activated;
    // getAllListItems()
}

$: length = $listItems.reduce(function (sum, item) {
    return sum + item.amount
}, 0)
</script>

<div class="container">
    <button class={(activated ? "activated-button" : "")} on:click={handleClick}>
        Shopping List 
        <div class="count">
            {length}
        </div>
    </button>

    <div class={"dropdown " + (activated ? "activated" : "")}>
        <ShoppingLists />
    </div>
</div>


<style>
    .container {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .dropdown {
        display: none;
    }
    .activated {
        display: flex;
        position: absolute;
        top: 100%;
        left: -25%;
    }

    button {
        height: 100%;
        padding: 10px;
        position: relative;
    }
    .count{
        color: white;
        background-color: red;
        border-radius: 50%;
        width: 20px;
        height: 20px;
        position: absolute;
        top: 5px;
        right: 0;
    }
    .activated-button {
        background-color: blue;
        color: white;
    }
</style>