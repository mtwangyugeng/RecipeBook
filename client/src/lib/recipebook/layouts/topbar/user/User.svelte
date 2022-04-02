<script>
import {user} from '../../../stores/User.js'
import FormSignUp from "../../../forms/PostSignUp.svelte"
import FormSignIn from "../../../forms/PostSignIn.svelte"
import FormLogOut from "../../../forms/PostLogOut.svelte"

let signningIn = false;
let signningUp = false;
let loggingOut = false;

</script>

<section>
    <!-- <button class="setting">
    </button> -->
{#if $user.email}
    {$user.email}
    <button on:click={()=>{loggingOut=true}}>Log Out</button>
{:else}
    <button class="sign-in" on:click={()=>{signningIn=true}}>Sign In</button>
    <!-- <button on:click={()=>{signningUp=true}}>Sign Up</button> -->
{/if}
</section>

{#if signningIn}
    <FormSignIn close={()=>{signningIn=false}}/>
{:else if signningUp}
    <FormSignUp close={()=>{signningUp=false}}/>
{:else if loggingOut}
    <FormLogOut close={()=>{loggingOut=false}}/>        
{/if}

    

<style>
    section {
        width: 150px;
        background-color: white;
        display: flex;
        justify-content: space-around;
        align-items: center;
    }

    /* button:hover {
        color: red;
    } */

    .sign-in {
        font-family: Arial, Helvetica, sans-serif;
        font-weight: bold;
        color: #fff;

        background-color: rgb(173, 117, 11);
        width: 100px;
        height: 35px;
        border-radius: 5px;
    }
    .sign-in:hover {
        filter: brightness(125%);
    }
    
    /* .setting {
        background-color: red;
        width: 35px;
        height: 35px;
    } */
</style>