<script>
    import {deleteProcedure, updateProcedure} from "../../stores/Procedure.js"
    export let content = "Add content.";
    export let id;
    const handleDelete = function() {
        deleteProcedure(id)
    }
    let updating = false;
    let updated = content
    const handleUpdate = function() {
        if (updating){
            updateProcedure(id, {content: updated})
            updating = false
        }
        else
            updating = true;
    }
</script>

<li>
    {#if updating}
        <input bind:value={updated}>
    {:else}
        {content}
    {/if}
    <div>
    <button class="update" on:click={handleUpdate}>{updating ? "submit" : "update"}</button>
    <button class="delete" on:click={handleDelete}>-</button>
    </div>
</li>

<style>
    li {
        
        background-color: rgb(0, 255, 115);
        display: flex;
        justify-content: space-between;
    }
    .delete {
        background-color: red;
        border-radius: 50%;
        width: 20px;
        height: 20px;
    }

    .update:hover {
        color: white;
    }
</style>