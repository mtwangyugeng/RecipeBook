<script>
    import {token} from "../stores/User.js";
    import {postAmount} from "../stores/Amount.js"

    import PopoutMessage from "./PopoutMessage.svelte";
    export let close;

    let message = "Please enter amount properties";

    export let recipe_id;

    let impJson = {
            amount: "",
            ingredient_id: "",
        };

    const handleSubmit = async () => {
        message = "requesting..."
        const status = await postAmount({...impJson, recipe_id}, $token)
        if(status == 201) {
            close();
        }
    }
    
    
    </script>
    
    <PopoutMessage close={close} title={`New procedure in ${recipe_id}`}>
        {message}
        <form on:submit|preventDefault={handleSubmit}>
            {#each Object.keys(impJson) as name}
                <label for={name}>{name}:</label> <br>
                <input bind:value={impJson[name]} id={name} placeholder={`Enter ${name}`} required>
            {/each}
            <input type="submit" value="Submit">
        </form>    
    </PopoutMessage>
    
    <style>
        form {
            width: 400px;
    
            display: flex;
            flex-direction: column;
            padding: 20px;
        }
    
        form > input[type="submit"] {
            background-color: yellow;
            padding: 10px;
        }
        form > input[type="submit"]:hover {
            background-color: rgb(255, 145, 0);
        }
    
    
        label {
            user-select: none;
            cursor: pointer;
        }
    </style>