<script>
    import {token} from "../stores/User.js";
    import {postAmount} from "../stores/Amount.js"

    import PopoutMessage from "./PopoutMessage.svelte";
    export let close;
    import RequestingScreen from "./RequestingScreen.svelte";

    let message = "Please enter amount properties";

    export let recipe_id;

    
    let selectedIngredient = null;
    let amount = "";
    
    $: impJson = {
            amount: amount,
            ingredient_id: selectedIngredient && selectedIngredient.id,
        };

    const handleSubmit = async () => {
        message = "Requesting..."
        const status = await postAmount({...impJson, recipe_id}, $token)
        if(status == 201) {
            close();
        }
    }
    
    import {ingredients} from "../stores/Ingredient.js";
    </script>
    
    <PopoutMessage close={close} title={`New Ingredient in Recipe ${recipe_id}`}>
        {message}
        <form on:submit|preventDefault={handleSubmit}>
            <label for="ingredient">Ingredient:</label> <br>
            <select name="ingredient" id="ingredient" bind:value={selectedIngredient} required>
                {#each $ingredients as ingredient (ingredient.id)}
                    <option value={ingredient}>{ingredient.name}</option>
                {/each}
              </select>

            <label for="amount">Amount:</label> <br>

            <div class="amount-container">
                <input type="number" bind:value={amount} id="amount" placeholder={`Enter Amount`} required>
                {selectedIngredient ? selectedIngredient["unit"]: "<unit>"}
            </div>


            <input type="submit" value="Submit">
        </form>

        <RequestingScreen message={message}/>
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