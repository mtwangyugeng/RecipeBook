<script>
    import {token} from "../stores/User.js";
    import {postIngredient} from "../stores/Ingredient.js"

    import PopoutMessage from "./PopoutMessage.svelte";
    export let close;

    let message = "Please enter ingredient properties";

    import IngredientCard from "../layouts/ingredients/IngredientCard.svelte"
    let impJson = {
            id:"<id>",
            name: "",
            unit: "",
            best_market: "",
            common_quantity: "",
            common_price: "",
        };

    const handleSubmit = async () => {

        // TODO: check input

        message = "requesting..."
        const status = await postIngredient(impJson, $token)
        if(status == 201) {
            close();
        }
    }
    
    
    </script>
    
    <PopoutMessage close={close} title="New Ingredient">
        {message}
        <form on:submit|preventDefault={handleSubmit}>
            
            <div class="top">
                <div class="input">
                    <label for="name">Ingredient Name:</label> <br>
                    <input bind:value={impJson.name} id="name" placeholder= "Enter Name"  required> <br>

                    <label for="best_market">Best Shop:</label> <br>
                    <input bind:value={impJson.best_market} id="best_market" placeholder= "Enter Shop Name"  required> <br>

                    <label for="common_quantity">Package Size:</label> <br>
                    <input type="number" bind:value={impJson.common_quantity} id="common_quantity" placeholder= "Enter Pakage Size"  required> <br>

                    <label for="unit">Package Unit:</label> <br>
                    <select bind:value={impJson.unit} required>
                        <optgroup label="Volumn">
                          <option value="ml">ml</option>
                          <option value="L">L</option>
                        </optgroup>
                        <optgroup label="Weight">
                          <option value="kg">kg</option>
                          <option value="g">g</option>
                        </optgroup>
                        <optgroup label="Other">
                            <option value="peice">peice</option>
                        </optgroup>
                    </select>
                    <br>

                    <label for="common_price">Package Price:</label> <br>
                    <input type="number" bind:value={impJson.common_price} id="common_price" placeholder= "Enter Pakage Unit"  required> <br>

                </div>
                <IngredientCard {...impJson} />
            </div>
            
            <input type="submit" value="Submit">
        </form>    
    </PopoutMessage>
    
    <style>
        form {
            width: 500px;
    
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

        .top {
            display: flex;
        }

        .input {
        }

        .input > input {
            width: 200px;
            padding: 5px;
        }
    </style>