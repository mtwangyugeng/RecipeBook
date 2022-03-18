<script>
    export let currentTab;
    export let tabName;
    $: activated = (currentTab == tabName);
    export let switchTab;
    const handleClick = function () {
        switchTab(tabName)
    }
</script>

<button class={activated && "activated"} on:click={handleClick}>
    {tabName}
</button>


<style>
    button {
        padding-left: 10px;
        padding-right: 10px;
    }

    button:hover {
        color: rgb(92, 38, 13);
    }

    .activated {
        background-color: blue;
        color: white;
    }
</style>