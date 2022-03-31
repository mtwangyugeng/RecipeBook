<script>
    import {add} from "../../stores/ShoppingList"

    export let id;

    const handleSubmit = () => {
        console.log(id)
        // add id to the shopping list
        add(id)
    }
</script>


<button on:click={handleSubmit}>
    +
</button>


<style>
    button {
        background-color: rgb(255, 255, 255);
        border: 1px solid #000;
        width: 20px;
        height: 20px;
        border-radius: 50%;
        position: absolute;
        right:0;
        margin-right: 5px;
    }
    button:hover {
        filter: brightness(80%);
    }
</style>