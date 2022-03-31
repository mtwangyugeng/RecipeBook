<script>
import ShoppingListButton from './ShoppingListButton.svelte';

//  NavList + userInfo
    export let tabs;
    export let switchTab;
    export let currentTab;

    import Tab from './Tab.svelte';
    import User from './user/User.svelte';

</script>


<div class="container">
    <nav>
        {#each tabs as tabName (tabName)}
            <Tab currentTab={currentTab} switchTab={switchTab} tabName={tabName}/> 
        {/each}
    </nav>

    <ShoppingListButton />
    <User />
</div>


<style>
    .container {
        /* background-color: green; */
        height: 50px;
        display: flex;
        justify-content: space-between;

        z-index: 99;
        -webkit-box-shadow: 0px 6px 12px -3px rgba(0,0,0,0.49); 
        box-shadow: 0px 6px 12px -3px rgba(0,0,0,0.49);
    }
    nav {
        display: flex;
        width: 70%;
    }
</style>