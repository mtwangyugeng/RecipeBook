<script>
    import {token} from "../stores/User.js"

    export let post;
    export let closeWindow;

    let recipe_name;
    let message = "Please enter a recipe name";

    const handleSubmit = async () => {
        message = `Making request...`
        const status = await post({title: recipe_name}, $token)
        if (status == 201){
            closeWindow();
        }else{
            message = `Failed status: ${status}`
        }
    }
</script>

{message}
<form on:submit|preventDefault={handleSubmit}> 
    <label for="recipe_name">Recipe name:
        <input bind:value={recipe_name} placeholder="Enter recipe name">
    </label>
    <input type="submit" value="Submit">
</form>


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