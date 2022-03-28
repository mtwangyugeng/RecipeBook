<script>
import PopoutMessage from "../../commons/PopoutMessage.svelte";

    export let activated = false;

    export let id;
    let amount;

    const handleSubmit = () => {
        const loatout = {id:id, amount:amount}
        console.log(loatout)
    }
</script>


<button on:click={()=>activated = true}>
    +
</button>

{#if activated}
    <PopoutMessage close={()=>activated = false} title="Add to the Shopping List">
        <form on:submit|preventDefault={handleSubmit}>
            <label for="amount">
                Enter amount: 
                <input id="amount" type="number" bind:value={amount} />
            </label>
            <input type="submit" value="Add"/>
        </form>
    </PopoutMessage>
{/if}


<style>
    form {
        padding: 10px;
        display: flex;
        flex-direction: column;
    }
    label {
        margin: 10px;
    }

    form > input[type="submit"] {
        background-color: yellow;
        padding: 10px;
    }
    form > input[type="submit"]:hover {
        background-color: rgb(255, 145, 0);
    }
    

    button {
        background-color: rgb(255, 255, 255);
        border: 1px solid #000;
        width: 20px;
        height: 20px;
        border-radius: 50%;
        position: absolute;
        right:0;
        margin-right: 5px;
    }
    button:hover {
        filter: brightness(80%);
    }
</style>