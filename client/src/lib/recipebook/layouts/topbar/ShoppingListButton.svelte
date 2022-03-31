<script>
import ShoppingLists from "../shoppinglists/ShoppingLists.svelte";


let activated = false;
const handleClick = function () {
    activated = !activated;
}
</script>

<div class="container">
    <button class={(activated ? "activated-button" : "")} on:click={handleClick}>
        Shopping List
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
        background-color: blue;
    }

    button {
        padding: 10px;
    }
    .activated-button {
        background-color: blue;
    }
</style>