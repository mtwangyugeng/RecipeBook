<script>
import {user, postSignin, postSignup, logout} from '../../stores/User.js'
import FormSignUp from "../../forms/PostSignUp.svelte"
import FormSignIn from "../../forms/PostSignIn.svelte"

let signningIn = false;
let signningUp = false;
let loggingOut = false;
</script>

<section>
{#if $user.email}
    {$user.email}
    <button on:click={logout}>Log Out</button>
{:else}
    <button on:click={()=>{signningIn=true}}>Sign In</button>
    <button on:click={()=>{signningUp=true}}>Sign Up</button>
{/if}
</section>

{#if signningIn}
    <FormSignIn close={()=>{signningIn=false}}/>
{/if}

{#if signningUp}
    <FormSignUp close={()=>{signningUp=false}}/>
{/if}

<style>
button:hover {
    color: red;
}
</style>