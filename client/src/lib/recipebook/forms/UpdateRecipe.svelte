<script>
    import PopoutMessage from "./PopoutMessage.svelte";
    export let close;

    let recipe_name;
    let message = "Please enter a new recipe name";

    import {updateRecipe} from "../stores/Recipe.js";
    import {token} from "../stores/User.js";
    export let updatingRecipeId;
    const handleSubmit = async () => {
        message = `Making request...`
        const status = await updateRecipe(updatingRecipeId, {title: recipe_name}, $token)
        if (status == 202){
            close();
        }else{
            message = `Failed status: ${status}`
        }
    }
</script>

<PopoutMessage close={close} title={`update recipe id=${updatingRecipeId}`}>
    {message}
    <form on:submit|preventDefault={handleSubmit}> 
        <label for="recipe_name">Recipe name:
            <input bind:value={recipe_name} placeholder="Enter recipe name">
        </label>
        <input type="submit" value="Submit">
    </form>
</PopoutMessage>


<style>
    form {
        display: flex;
        justify-content: space-around;
        padding: 20px;
    }

    form > input[type="submit"] {
        background-color: yellow;
    }
</style>