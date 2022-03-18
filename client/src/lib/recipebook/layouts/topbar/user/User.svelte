<script>
import {user, postSignin, postSignup, logout} from '../../../stores/User.js'
import FormSignUp from "../../../forms/PostSignUp.svelte"
import FormSignIn from "../../../forms/PostSignIn.svelte"
import FormLogOut from "../../../forms/PostLogOut.svelte"

let signningIn = false;
let signningUp = false;
let loggingOut = false;
</script>

<section>
{#if $user.email}
    {$user.email}
    <button on:click={()=>{loggingOut=true}}>Log Out</button>
{:else}
    <button on:click={()=>{signningIn=true}}>Sign In</button>
    <button on:click={()=>{signningUp=true}}>Sign Up</button>
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
        width: 30%;
        background-color: white;
        display: flex;
        justify-content: space-around;
        align-items: center;
    }

    button:hover {
        color: red;
    }
</style>