<script>
    import {shoppingLists} from "../../stores/ShoppingList.js";
    import ShoppingList from "./ShoppingList.svelte";
</script>

<section>
{#each $shoppingLists as shoppingList (shoppingList.id)}
    <ShoppingList shoppingList={shoppingList}/>
{/each}
</section>