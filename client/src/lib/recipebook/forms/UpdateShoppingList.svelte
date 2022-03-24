<script>
    // import update requeest

    import PopoutMessage from "./PopoutMessage.svelte";
    import ShoppingList from "../layouts/shoppinglists/ShoppingList.svelte";
    
    import {updateShoppingList} from "../stores/ShoppingList.js"
    import {token} from "../stores/User.js";
    import RequestingScreen from "../commons/RequestingScreen.svelte";

    export let close;

    export let id;
    export let name;
    let newJson = {
            id: id,
            name: name,
        };
        
    let message = "Please enter a new recipe name";
    const handleSubmit = async () => {
        message = `Making request...`
        const status =  updateShoppingList(id, newJson, $token)
        console.log(status)
        if (status == 202){
            close();
        }else{
            message = `Failed status: ${status}`
        }
    }

</script>

<PopoutMessage title={`Rename Shopping List id:#${id}`} close={close}>
    <form on:submit|preventDefault={handleSubmit}>
        {message}
        <div class="container">
            <div class="left">
                <label for="name">Shopping List Name:</label> <br>
                <input bind:value={newJson.name} id="name" placeholder= "Enter Name"  required> <br>
            </div>
            
            <div class="right">
                <ShoppingList shoppingList={newJson} />
            </div>
        </div>
        <input type="submit" value="Submit">
    </form>
    <RequestingScreen message={message}/>
</PopoutMessage>


<style>

    form {
        padding: 10px;
        display: flex;
        flex-direction: column;
    }

    form > input[type="submit"] {
            background-color: yellow;
            padding: 10px;
        }
    form > input[type="submit"]:hover {
        background-color: rgb(255, 145, 0);
    }

    .container {
        display: flex;
    }
</style>