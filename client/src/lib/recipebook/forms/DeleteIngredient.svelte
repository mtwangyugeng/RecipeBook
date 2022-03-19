<script>
    import PopoutMessage from "./PopoutMessage.svelte";
    export let close;
    
    let message = "Delete this Ingredient?";

    import {deleteIngredient} from "../stores/Ingredient.js";
    import {token} from "../stores/User.js";
    export let id;
    const handleSubmit = async () => {
        message = `Making request...`
        const status = await deleteIngredient(id, $token)
        if (status == 303){
            close();
        }else{
            message = `Failed status: ${status}`
        }
    }
</script>

<PopoutMessage close={close} title={`delete recipe id=${id}`}>
    {message}
    <button on:click={handleSubmit}> Yes </button>
    <button on:click={close}> Cancel </button>
</PopoutMessage>


<style>

</style>