<script>
    import PopoutMessage from "./PopoutMessage.svelte";
    import RequestingScreen from "./RequestingScreen.svelte";

    import {token} from "../stores/User.js";
    import {updateIngredient} from "../stores/Ingredient.js"

    export let close;

    export let id;
    export let name;
    export let unit;
    export let best_market;
    export let common_quantity;
    export let common_price;

    let message = "Please enter ingredient properties";

    import IngredientCard from "../layouts/ingredients/IngredientCard.svelte"
    let impJson = {
            id: id,
            name: name,
            unit: unit,
            best_market: best_market,
            common_quantity: common_quantity,
            common_price: common_price,
        };

    const handleSubmit = async () => {
        // TODO: check input
        message = "Requesting...";
        const status = await updateIngredient(id, impJson, $token)
        if(status == 202) {
            close();
        } else {
            message = "Update failed, code: " + status;
        }
    }
    
    
    </script>
    
    <PopoutMessage close={close} title="Update Ingredient">
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

                <div class="preview">
                    <IngredientCard {...impJson} />
                </div>
            </div>
            
            <input type="submit" value="Submit">
        </form>
        <RequestingScreen message={message}/>  
    </PopoutMessage>
    
    <style>
        .preview {
            pointer-events: none;
            user-select: none;
            margin: 10px auto;
        }
        
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


        .input > input {
            width: 200px;
            padding: 5px;
        }
    </style>