<script>
    import {shoppingLists, getAllShoppingLists} from "../../stores/ShoppingList.js";

    getAllShoppingLists();
import ListItem from "./ListItem.svelte";
</script>

<section>
    {#each $shoppingLists as shoppingList (shoppingList.id)}
        <ListItem {...shoppingList}/>
    {/each}
</section>

<style>
    section {
        display: flex;
    }
</style>