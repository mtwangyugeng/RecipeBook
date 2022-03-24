<script>
    import {shoppingLists, getAllShoppingLists} from "../../stores/ShoppingList.js";
    import ShoppingList from "./ShoppingList.svelte";

    getAllShoppingLists();
</script>

<section>
    {#each $shoppingLists as shoppingList (shoppingList.id)}
        <ShoppingList shoppingList={shoppingList}/>
    {/each}
</section>

<style>
    section {
        display: flex;
    }
</style>