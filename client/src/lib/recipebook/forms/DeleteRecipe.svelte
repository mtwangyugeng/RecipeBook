<script>
    import PopoutMessage from "./PopoutMessage.svelte";
    export let close;
    
    let message = "Delete this recipe?";

    import {deleteRecipe} from "../stores/Recipe.js";
    import {token} from "../stores/User.js";
    export let deletingRecipeId;
    const handleSubmit = async () => {
        message = `Making request...`
        const status = await deleteRecipe(deletingRecipeId, $token)
        if (status == 303){
            close();
        }else{
            message = `Failed status: ${status}`
        }
    }
</script>

<PopoutMessage close={close} title={`delete recipe id=${deletingRecipeId}`}>
    {message}
    <button on:click={handleSubmit}> Yes </button>
    <button on:click={close}> Cancel </button>
</PopoutMessage>


<style>

</style>