<script>
import {user} from '../../../stores/User.js'
import FormSignUp from "../../../forms/PostSignUp.svelte"
import FormSignIn from "../../../forms/PostSignIn.svelte"
import FormLogOut from "../../../forms/PostLogOut.svelte"

let signningIn = false;
let signningUp = false;
let loggingOut = false;


import {token} from "../../../stores/User.js"
import { getAllListItems, listItems } from '../../../stores/ShoppingList';
import { getAllIngredients, ingredients } from '../../../stores/Ingredient'
import { getAllAmounts, amounts } from '../../../stores/Amount.js';
import { getAllProcedures, procedures } from '../../../stores/Procedure.js';
import { getAllRecipes, recipes } from '../../../stores/Recipe.js';
token.subscribe(v=> {
    if (v.length > 0) {
        getAllIngredients()
            .then(() => {
                getAllListItems();
                getAllAmounts();
                getAllProcedures();
                getAllRecipes();
            });
    } else {
        listItems.set([]);
        ingredients.set([]);
        amounts.set([]);
        procedures.set([]);
        recipes.set([]);
    }
})

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