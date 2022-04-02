<script>
    import {deleteProcedure} from "../../stores/Procedure.js"
    export let content = "Add content.";
    export let id;
    const handleDelete = function() {
        deleteProcedure(id)
    }
</script>

<li>
    {content}
    <button on:click={handleDelete}>-</button>
</li>

<style>
    li {
        margin-top: 20px;
        background-color: rgb(0, 255, 115);
        padding: 20px;
        border-radius: 15px;
        display: flex;
        justify-content: space-between;
    }
    button {
        background-color: red;
        border-radius: 50%;
        width: 20px;
        height: 20px;
    }

</style>