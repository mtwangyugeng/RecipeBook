<script>
//  NavList + userInfo
export let tabs;
export let switchTab;

import {user} from '../stores/User'
import User from './user/User.svelte';
</script>


<div class="container">
    <nav>
        {#each tabs as tab (tab)}
            <button class="tab" on:click={()=>{switchTab(tab)}}>{tab}</button>
        {/each}
    </nav>
    <User />
</div>


<style>
    .container {
        background-color: green;
        height:5%;
        display: flex;
        justify-content: space-between;
    }
    nav {
        display: flex;
    }
    .tab:hover{
        color: red;
    }
</style>