<script>
    //  NavList + userInfo
    export let tabs;
    export let switchTab;

    import {user} from '../stores/User'
</script>


<div class="container">
    <nav>
        {#each tabs as tab (tab)}
            <div class="tab" on:click={()=>{switchTab(tab)}}>{tab}</div>
        {/each}
    </nav>

</div>


<style>
    .container {
        background-color: green;
        height:5%;
    }
    nav {
        display: flex;
    }
    .tab {
        cursor: pointer;
    }
    .tab:hover{
        color: red;
    }
</style>