<script>
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
    <User />
</div>


<style>
    .container {
        background-color: green;
        height: 50px;
        display: flex;
        justify-content: space-between;
    }
    nav {
        display: flex;
        background-color: rgb(51, 255, 0);
        width: 70%;
    }
</style>