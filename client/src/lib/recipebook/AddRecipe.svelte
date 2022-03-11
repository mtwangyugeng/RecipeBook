<script>
    export let closeWindow;
</script>

<div class="container">
    <section>
        <div class="topbar">
            <button on:click={closeWindow}>x</button>
        </div>
        <form>
            
        </form>
    </section>
</div>


<style>
    .container {
        position: fixed;
        width: 100vw;
        height: 100vh;
        background-color: rgba(0,0,0, 0.7);

        display: flex;
        justify-content: center;
        align-items: center;
    }

    section {
        background-color: white;
        width: 400px;
        height: 400px;
    }

    .topbar {
        background-color: green;
        display: flex;
        flex-direction: row-reverse;
    }
</style>