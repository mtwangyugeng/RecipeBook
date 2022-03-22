<script>
import DeleteButton from "../../commons/DeleteButton.svelte";
import PopoutMessage from "../../commons/PopoutMessage.svelte";
import RenameButton from "../../commons/RenameButton.svelte";
import UpdateShoppingList from "../../forms/UpdateShoppingList.svelte";

    export let shoppingList;
    let updating = false;
</script>

<div class="container">
    <h3>#{shoppingList.id} {shoppingList.name}</h3>
    <RenameButton activate={()=>{updating = true}} />
    <DeleteButton />
</div>

{#if updating}
    <PopoutMessage title={`Rename Shopping List id:#${shoppingList.id}`} close={()=>{updating=false}}>
        <UpdateShoppingList />
    </PopoutMessage>
{/if}

<style>
    .container {
        background-color: yellow;
        margin: 10px;
        padding: 10px;
        cursor: pointer;
    }
</style>