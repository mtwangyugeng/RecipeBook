<script>
    import PopoutMessage from "./PopoutMessage.svelte";
    export let close;

    let recipe_name;
    let message = "Please enter a recipe name";

    import {postRecipe} from "../stores/Recipe.js";
    import {token} from "../stores/User.js";
    const handleSubmit = async () => {
        message = `Making request...`
        const status = await postRecipe({title: recipe_name}, $token)
        if (status == 201){
            close();
        }else{
            message = `Failed status: ${status}`
        }
    }
</script>

<PopoutMessage close={close} title="Add more recipe">
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